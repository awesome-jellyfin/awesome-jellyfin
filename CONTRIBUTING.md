# Contribution Guidelines

Please note that this project is released with a [Contributor Code of Conduct](CODE-OF-CONDUCT.md). 
By participating in this project you agree to abide by its terms.

## Pull Requests

Ensure your pull request adheres to the following guidelines:

- Use the [Conventional Commits specification](https://www.conventionalcommits.org/en/v1.0.0/) (`<type>[optional scope]: <description>`).
- **Alphabetical Sorting**: Items in `README.md` must be sorted alphabetically. See [Sorting Rules](#sorting-rules).
- **Templated Content**: Some files, like `CLIENTS.md` are automatically generated from files. You should only edit the original source files from which they're generated from. See [Templated Content](#templated-content).
- Search previous suggestions before making a new one, as yours may be a duplicate.
- New categories, or improvements to the existing categorization are welcome.
- Keep descriptions short and simple, but descriptive and non-promotional.

Thank you for your suggestions!

---

## Project Criteria

To help maintain a useful and sustainable list, submitted projects are generally expected to meet the following guidelines. 
These are not strict requirements but serve as a guideline for new projects.

### Activity

* The project should be at least **4 weeks old**.
* The repository should show **recent and ongoing activity**.
* If automated checks are configured, they should be **passing on the default branch**.
* The project should show signs of **continued maintenance**.

### Quality & Documentation

Projects should meet baseline quality standards:

* A **clear and descriptive README** and/or documentation should be available.
* The commit history should reflect meaningful development activity.
* Contributors adding a project are encouraged to consider whether it is likely to remain maintained.
* **Small utilities or scripts should:**

  * Be broadly useful beyond a single use case.
  * Preferably be part of a larger project or collection if highly specific.
  * Avoid fragmenting the list into numerous minimal standalone scripts.

### Conduct

* Projects should not be associated with malicious, deceptive, or spam-related activity.
* Repositories should follow generally accepted open-source practices.

---

## Sorting Rules

Certain lists within this repository should be kept **alphabetically sorted**, according to a canonical version of each item. 
The rules for deriving this canonical version (used for sorting) are as follows:

1. **Square Brackets**:  
   - If the line contains text in square brackets (e.g., `- [My Item]`), only that bracketed text is used to determine the item's position.
   - If there are no square brackets, the entire line (minus the leading "`- `" if present) is used.
2. **Removing Characters**:  
   - From that resulting text, remove the following characters for sorting:
       ```
       [ -_().`',:!?]
       ```

If two items end up with the same canonical text, their **original order** is preserved. 

> [!NOTE]
> A bot will automatically check your PR for correct order.  
>  - You can manually fix sorting or ask a maintainer to run `/sort-check -fix` (if needed).

## Templated Content

Some files in this repository are automatically generated from other source files. For example, `CLIENTS.md` is generated from `assets/clients/clients.yaml`.  
- **Do not edit these generated files directly.** Instead, edit the original source files from which they’re generated.  
- Each generated file clearly indicates that it is automatically generated.
- Once you push your changes to the source file, the project’s checks will automatically regenerate the corresponding output file.  

> [!NOTE]
> For pull requests, a preview of the updated generated files will appear in the **Checks** tab of the pull request.
> ![image](https://github.com/user-attachments/assets/5ca13a18-f68d-4dc5-b91b-caa9015132d0)


## Updating your PR

A lot of times, making a PR adhere to the standards above can be difficult.
If the maintainers notice anything that we'd like changed, we'll ask you to
edit your PR before we merge it. There's no need to open a new PR, just edit
the existing one. If you're not sure how to do that,
[here is a guide](https://github.com/RichardLitt/knowledge/blob/master/github/amending-a-commit-guide.md)
on the different ways you can update your PR so that we can merge it.
