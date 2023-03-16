# Flags on Movie Posters

Ever wanted to easily identify the language of a movie at a glance? Now you can with this script!

This script adds flags to movie posters, so that you can quickly determine the language of the movie. Currently, it supports German and Dutch flags, but can easily be modified to support any language.

## Requirements

* `exiftool`
* `jq`
* FFmpeg (for `ffprobe`)
* imagemagick (for `convert`)

## Usage

1. Save the script to a file, e.g. `movie_flags.sh`
2. Change the `MOVIES_DIR` and `OVERLAY_DIR` variables and modify to your desired languages
3. Change the file permissions to make it executable, e.g. `chmod +x movie_flags.sh`
4. Run the script, e.g. `./movie_flags.sh`

## Credits

This script was created by [u/ProductRockstar](https://www.reddit.com/user/ProductRockstar/).
[[Original Post](https://www.reddit.com/r/jellyfin/comments/11dgmp3/script_to_add_language_overlay_to_movie_poster/)]
