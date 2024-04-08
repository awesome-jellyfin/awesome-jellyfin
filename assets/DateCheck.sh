#!/bin/bash

# Check if a GitHub API token is provided
if [ "$#" -ne 2 ] || [ "$1" != "-api" ]; then
    echo -e "${RED}Usage:>${NOCOLOR} $0 -api <github-api-token>"
    exit 1
fi

API_TOKEN=$2
API_HEADER="Authorization: token $API_TOKEN"
README_PATH="../README.md"
SIX_MONTHS=$(date -d "6 months ago" +%s)
PROPOSED_CHANGES=()

# Color codes for console output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NOCOLOR='\033[0m'

# Check if README.md exists
if [ ! -f "$README_PATH" ]; then
    echo -e "${RED}README.md not found in path:${NOCOLOR} $README_PATH"
    exit 1
fi

# Parse README.md and collect information
while IFS= read -r line; do
    original_text=$(echo "$line" | sed -E 's/^- \[([^]]+)\].*/\1/')
    text=$(echo "$original_text" | sed -E 's/ `[^`]+`//g') # Remove existing indicators
    url=$(echo "$line" | sed -E 's/.*\]\(([^)]+)\).*/\1/')

    if [[ $url == https://github.com* ]]; then
        repo_path=$(echo $url | cut -d/ -f4-5)
        response=$(curl -s -H "$API_HEADER" "https://api.github.com/repos/$repo_path")

        # Fetch additional details for forked repositories
        is_fork=$(echo $response | grep '"fork": true')
        if [ ! -z "$is_fork" ]; then
            parent_repo=$(echo $response | grep '"parent":' | grep -o '"full_name": "[^"]*"' | cut -d '"' -f 4)
            if [ ! -z "$parent_repo" ]; then
                parent_response=$(curl -s -H "$API_HEADER" "https://api.github.com/repos/$parent_repo")
                response=$parent_response
            fi
        fi

        # Get the latest commit date
        commits_url=$(echo $response | grep '"commits_url":' | sed -E 's/.*"commits_url": "([^"]+)".*/\1/')
        commits_url="${commits_url/\{\/sha\}/}"
        latest_commit=$(curl -s -H "$API_HEADER" "${commits_url}?per_page=1")
        last_commit_date=$(echo $latest_commit | grep '"date":' | head -1 | sed -E 's/.*"date": "([^"]+)".*/\1/' | cut -c 1-10)
        last_commit_sec=$(date -d "$last_commit_date" +%s)

        # Compare with six months ago
        if [[ $last_commit_sec -lt $SIX_MONTHS && ! $original_text == *📅* ]]; then
            PROPOSED_CHANGES+=("$original_text - Date: $last_commit_date - URL: $url")
        fi
    fi
done < <(grep '^-\ \[' "$README_PATH")

# Display proposed changes separately
echo -e "${YELLOW}Proposed Changes:${NOCOLOR}"
if [ ${#PROPOSED_CHANGES[@]} -eq 0 ]; then
    echo -e "${GREEN}No changes required.${NOCOLOR}"
else
    for change in "${PROPOSED_CHANGES[@]}"; do
        echo "$change"
    done

    # Ask for user confirmation
    echo -e "${YELLOW}Would you like to apply these changes?${NOCOLOR} (y/n)"
    read -r user_input

    if [[ $user_input == "y" ]]; then
        # Apply the changes
        for change in "${PROPOSED_CHANGES[@]}"; do
            text=$(echo "$change" | sed -E 's/ - Date:.*//') # Extract text without date and URL
            if ! grep -q "\[$text \`📅\`\]" "$README_PATH"; then
                sed -i "s|-\ \[$text\]|- \[$text \`📅\`]|" "$README_PATH"
            fi
        done
        echo -e "${GREEN}README.md has been updated.${NOCOLOR}"
    else
        echo -e "${RED}Changes were declined.${NOCOLOR}"
    fi
fi
