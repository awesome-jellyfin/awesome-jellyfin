# Themes

This folder holds the data behind [THEMES.md](../../THEMES.md). Each theme has one YAML file in `themes.d`. The bot generates `THEMES.md` from those files with `THEMES.md.tmpl`, so do not edit `THEMES.md` by hand.

## Adding a theme

1. Copy `themes.d/_template.yaml` to `themes.d/<name>.yaml`. Use a lowercase, hyphenated name, for example `my-theme.yaml`.
2. Fill it in. The template has a comment above every field.
3. Open a pull request.

## Fields

| Field         | Required | What it is                                                                                                                                                                     |
| ------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `owners`      | yes      | GitHub handles of the people who maintain the file. At least one.                                                                                                              |
| `name`        | yes      | Display name of the theme.                                                                                                                                                     |
| `author`      | yes      | Name of the author.                                                                                                                                                            |
| `repo`        | yes      | Link to the theme's repository.                                                                                                                                                |
| `status`      | yes      | `listed` puts the theme in the normal section of THEMES.md. `hidden` puts it in the collapsed section at the end, for themes not yet updated for the current Jellyfin version. |
| `variants`    | yes      | Versions of the theme. The first one is the default. Can be empty only if `requires_js` is `true`.                                                                             |
| `author_url`  | no       | Link to the author's profile.                                                                                                                                                  |
| `website`     | no       | Link to the theme's website or demo.                                                                                                                                           |
| `description` | no       | A short description.                                                                                                                                                           |
| `note`        | no       | Something users should know first.                                                                                                                                             |
| `requires_js` | no       | `true` if the theme needs JavaScript or a plugin, so a CSS-only preview is not possible.                                                                                       |
| `screenshots` | no       | List of screenshot links.                                                                                                                                                      |
| `groups`      | no       | Sections for the settings, see [Settings](#settings).                                                                                                                          |
| `settings`    | no       | What a visitor can change in the preview site, see [Settings](#settings).                                                                                                      |
| `stale`       | no       | Set by the maintainers. Do not add it.                                                                                                                                         |

Each variant has an `id`, a `name` and the `css` users paste into Jellyfin's Custom CSS. Write every `css` value as a `|-` block, even a single line, and write maps and lists in block style (one key or item per line), not as `{ ... }` or `[ ... ]`. A variant can also set `settings` to change the default of a setting for that variant.

Settings are optional, see [Settings](#settings).

## Variants and settings

Variants are mutually exclusive versions of a theme, such as a light and a dark edition. A visitor uses exactly one of them.

Settings are what a visitor can change on top of the chosen variant in the [preview site](https://awesome-jellyfin.github.io/themes/): add-on files, a color scheme, a corner radius. The site turns them into the CSS the visitor copies, so a theme can have a full theme builder without its own website.

## Settings

Every setting has an `id` (lowercase letters, digits, dots and hyphens), a `label` and a `type`. All but presets have a `default`. Optional on every setting:

| Field         | What it does                                                                                                                                                                     |
| ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `description` | A line under the label.                                                                                                                                                          |
| `group`       | The `id` of a group in `groups`. Groups are shown as sections, in the order of `groups`. Settings without a group come first.                                                    |
| `when`        | Show the setting only while another one has (`is`) or doesn't have (`not`) a value, e.g. `setting: palette` with `is: custom`. Takes a value or a list.                          |
| `tags`        | Small labels: `needs-plugin`, `not-in-preview`, `opinionated`, `experimental`.                                                                                                   |
| `page`        | The preview page that shows the setting best (`home`, `movies`, `movie`, `shows`, `series`, `season`, `playlists`, `playlist`, `guide`). Changing it switches the preview there. |
| `last`        | `true` puts the setting's `@import` lines after all others, for files that must load last.                                                                                       |
| `display`     | How the control looks, see the table below.                                                                                                                                      |

| Type     | Needs                                                                                                    | `default`                 | `display`                                              |
| -------- | -------------------------------------------------------------------------------------------------------- | ------------------------- | ------------------------------------------------------ |
| `toggle` | `css`, added while it's on                                                                               | `true` or `false`         | `switch` (default), `card`                             |
| `select` | two or more `options`: `value`, `label`, optional `css`, `description` and `swatch` (up to three colors) | one of the values         | `dropdown` (default), `segmented`, `swatches`, `cards` |
| `color`  | `var` or `css`. `alpha: true` allows transparent colors                                                  | a color, e.g. `"#00a4dc"` | `picker`                                               |
| `number` | `var` or `css`. Optional `min`, `max`, `step`, `unit`                                                    | a number                  | `slider` (default), `input`                            |
| `text`   | optional `css`, `placeholder` and `pattern` (a regular expression the whole value must match)            | text                      | `field`                                                |
| `image`  | optional `css`                                                                                           | an `https://` link        | `field`                                                |
| `preset` | `options`, each a `label`, optional `swatch` and the `values` it gives other settings                    | none                      |                                                        |

A `color` or `number` with `var` writes `--your-var: <value>;` in one `:root` block, and only when the visitor changed it (`number` adds its `unit`). Use `css` instead when you need more than one variable or a derived value. Text can't contain `; { } ( ) [ ] < > " '`, backslashes or `/*`, and images must be plain `https://` links, so what a visitor types can't break out of your CSS. A text `pattern` may only use syntax JavaScript and Go read the same way: character classes, `(?:...)` groups and quantifiers, but no flags, lookarounds or `\p` classes.

### Templates

Any `css` (of variants, settings and options) can hold placeholders: `{{ value }}` is the setting's own value, and `{{ <id> }}` is another setting's. Filters after a `|` change the value:

| Filter              | Example                             | Gives                                                |
| ------------------- | ----------------------------------- | ---------------------------------------------------- |
| `rgb`               | `{{ value \| rgb }}`                | `0, 164, 220`                                        |
| `r`, `g`, `b`       | `{{ value \| r }}`                  | `0`                                                  |
| `alpha <0-1>`       | `{{ value \| alpha 0.2 }}`          | `rgba(0, 164, 220, 0.2)`                             |
| `mix <color> <0-1>` | `{{ value \| mix "#ffffff" 0.07 }}` | the color, 7% towards white                          |
| `shade <-255-255>`  | `{{ value \| shade -30 }}`          | each channel 30 darker                               |
| `contrast`          | `{{ value \| contrast }}`           | `#000000` or `#ffffff`, whichever reads better on it |
| `hex`               | `{{ value \| hex }}`                | `#00a4dc`                                            |
| `px`                | `{{ value \| px }}`                 | `15px`                                               |
| `unit "<unit>"`     | `{{ value \| unit "rem" }}`         | `1.5rem`                                             |

Filters can be chained: `{{ value | shade -30 | alpha 0.4 }}`. A text setting is handy for a version that every `@import` uses: `@import url("https://cdn.jsdelivr.net/gh/you/theme@{{ version }}/theme.css");`.

The visitor's CSS is put together in this order: the variant's `css`, then the `css` of every shown setting (in file order), then the `:root` block with the changed `var` settings. Every `@import` moves to the top, those of `last` settings after the others.

[jellyfish.yaml](themes.d/jellyfish.yaml) uses most of this. Its custom palette, for example, is a `swatches` select with a `custom` option, and color settings that only show for it:

```yaml
groups:
  - id: palette
    label: Palette
settings:
  - id: color
    label: Palette
    type: select
    group: palette
    display: swatches
    default: jellyblue
    options:
      - value: jellyblue
        label: Jelly Blue
        swatch:
          - "#00a4dc"
          - "#181818"
      - value: custom
        label: Custom
  - id: accent
    label: Accent
    type: color
    group: palette
    default: "#00a4dc"
    when:
      setting: color
      is: custom
    css: |-
      :root {
        --primary-r: {{ value | r }};
        --primary-g: {{ value | g }};
        --primary-b: {{ value | b }};
        --primary-alt1: {{ value | shade -30 | alpha 1 }};
      }
  - id: radius
    label: Corner radius
    type: number
    group: palette
    default: 15
    min: 0
    max: 30
    unit: px
    var: --rounded-cards
```

The bot checks every template on the pull request: unknown settings or filters, a `when` pointing at a value its setting can never have, and presets with invalid values all block the merge.

## What happens on the pull request

The bot posts a comment that shows your entry as it will appear in THEMES.md. It also runs checks:

- Blocking checks must pass before the pull request can be merged. Examples are schema errors and install CSS that cannot be reached.
- Warnings do not block. For example, a screenshot that does not load.

## The stale tag

The stale tag in THEMES.md marks themes that look unmaintained. The maintainers' stale scan sets it. Do not set it by hand.
