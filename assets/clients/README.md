# Jellyfin Client YAML Configuration Format

This configuration file is used by the [Markdown generator](https://github.com/awesome-jellyfin/clients-md-generator) to produce the Clients list.

---

## 1. `clients` Section

The `clients` section lists all Jellyfin-compatible client applications, each with a set of fields describing its details.

### Client Fields

| Field               | Type                         | Required | Description                                                                                                      |
|---------------------|------------------------------|----------|------------------------------------------------------------------------------------------------------------------|
| **`name`**          | String                       | **Yes**  | The human-readable name of the client.                                                                           |
| **`targets`**       | List of strings              | **Yes**  | One or more environment/platform keys (e.g., `Windows`, `Android`, `iOS`). These must match target definitions in `targets`. |
| `official`          | Boolean                      | No       | Indicates whether the client is an official Jellyfin project. Used to display a special badge. Defaults to true if its `oss` URL is within the [jellyfin org](https://github.com/jellyfin/). |
| `beta`              | Boolean                      | No       | Whether the client is currently in beta. Used to display a special badge if set.                                  |
| `website`           | String                       | No       | An alternative or official website URL for the client. If not provided, the generator uses the `oss` URL in tables. |
| **`oss`** (yaml key: `oss`) | String             | No       | The open-source repository URL for the client, if applicable (e.g., GitHub, GitLab, etc.).                       |
| `price`             | **Price** (see below)        | No       | Indicates cost details (free, paid). Defaults to **free** if `oss` is present.                                    |
| **`downloads`**     | List of **Download items**   | **Yes**  | A list describing where or how to download the client. Each item has a `type` to determine the resulting Markdown link or badge. |
| `types`             | List of strings              | No       | A list of additional categories or features that apply to this client (e.g., `Music`, `Reader`, etc.).           |

#### 1.1 `price` Structure

The `price` object describes whether the client is free, paid, or both:

```yaml
price:
  free: true
  paid: true
```

| Field  | Type    | Required | Description                                                                                                |
|--------|---------|----------|------------------------------------------------------------------------------------------------------------|
| `free` | Boolean | No       | Whether the client is free. Defaults to **true** if `oss` is present.                                      |
| `paid` | Boolean | No       | Whether there is a paid version of the client. Setting both `free` and `paid` to true indicates a freemium or optional purchase model. |

---

#### 1.2 `downloads` List

Each item in `downloads` describes a button/badge/link for where to get the client. The generator has multiple **type** handlers, each producing a specific style of link or shield badge.

Each `Download` object has a **`type`** key (required) to determine which of the generator’s “renderer” structs to use:

| `type` Value    | Additional Fields                                          | Purpose / Example Output                                                                                                                          |
|-----------------|------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| **`icon`**      | `icon`, `url`                                             | Renders an icon from `assets/clients/icons/<icon>.png` linked to `url`. Not typically used if you want dynamic badges like shield.io, but can embed a static icon. |
| **`text`**      | `text`, `url`                                             | Renders a simple **text link** with `[text](url)` format.                                                                                        |
| **`github`**    | `owner`, `repo`, optional `url`                           | Renders a GitHub total downloads badge (`![](https://img.shields.io/github/downloads/owner/repo/total)`). Defaults the link to GitHub releases unless `url` is provided. |
| **`flathub`**   | `package`, optional `url`                                 | Renders a Flathub downloads badge for a specific Flatpak package.                                                                                |
| **`docker`**    | `user`, `repo`, optional `url`                            | Renders a Docker Hub pulls badge.                                                                                                                |
| **`shield`**    | `label`, `content`, `icon`, `color`, **`url`**            | Builds a custom shield.io badge. All fields except `url` are optional, letting you control label text, icon, color, etc.                          |
| **`gitlab`**    | `owner`, `repo`, optional `url`                           | Renders a GitLab badge that reuses the `shield` logic under the hood, with a default GitLab logo.                                                |
| **`demo`**      | **`url`**                                                 | Renders a “Demo” button shield linking to the `url`.                                                                                             |
| **`app-store`** | `id`, optional `url`                                      | Renders an App Store shield linking to `https://apps.apple.com/app/id<id>` by default.                                                           |
| **`google-play`** | `id`, optional `url`                                    | Renders a Google Play shield linking to `https://play.google.com/store/apps/details?id=<id>` by default.                                         |

> [!IMPORTANT]
> If a particular `type` key is unknown, the generator will fail with an error (`“unknown download type”`).

Below is an example `downloads` list for a single client:

```yaml
downloads:
  - type: github
    owner: jellyfin
    repo: jellyfin-media-player
  - type: flathub
    package: com.github.iwalton3.jellyfin-media-player
```

---

### Example Client

Below is a real-world example from the `clients.yaml`:

```yaml
- name: "Swiftfin"
  targets: [ iOS, AppleTV ]
  oss: https://github.com/jellyfin/swiftfin
  official: true
  beta: true
  downloads:
    - type: app-store
      id: "1604098728"
```

Here:

- It’s official, in beta, open-sourced on GitHub.
- It supports `iOS` and `AppleTV`.
- There’s a single download link, an App Store badge, referencing the app ID `1604098728`.

---

## 2. `targets` Section

The `targets` section defines logical groupings (e.g. Desktop, Mobile, TV, Browser) and the individual “sub-targets” that belong within each group.

**Goal:** Let the generator know how to categorize your clients by environment. When it outputs the final Markdown, it will list clients under these group headings.

```yaml
targets:
  - key: Browser
    display: "🌎 Browser-Based"
    has:
      - name: Browser
        mapped: Browser
  - key: Desktop
    display: "💻 Desktop"
    has:
      - name: Windows
        mapped: Windows
      - name: macOS
        mapped: "macOS"
      - name: Linux
        mapped: "Linux"
  ...
```

### Target Group Fields

| Field     | Type        | Required | Description                                                                        |
|-----------|------------|----------|------------------------------------------------------------------------------------|
| `key`     | String      | Yes      | The internal, high-level identifier (e.g., `Desktop`, `Mobile`).                  |
| `display` | String      | Yes      | The heading text shown in the output (can include emoji).                          |
| `has`     | List of `Target` | Yes | The specific target environment entries inside this group.                         |

### Target Definition

Each item in `has`:

| Field    | Type   | Required | Description                                                             |
|----------|--------|----------|-------------------------------------------------------------------------|
| `name`   | String | Yes      | The exact name used under a client’s `targets` array (e.g. `Windows`). |
| `mapped` | String | Yes      | A human-friendly name used in the rendered Markdown heading.           |

> **Example**  
> If a client has `"targets: [ Windows ]"`, the generator will place that client in the table under the `Desktop` group → `Windows` subheading, if you have:

```yaml
- key: Desktop
  display: "💻 Desktop"
  has:
    - name: Windows
      mapped: "Windows"
```

---

## 3. `types` Section

The `types` section describes extra categories (like *Music*, *Reader*, etc.) that you can assign to clients.  

Each type can optionally be displayed in a separate “By Type” section. If `section: true`, the generator will build an additional heading and table for all clients matching that `types` key.  

Each type can also define a `badge`—the generator uses this to add a mini badge next to the client name or in a type legend.

```yaml
types:
  - key: Official
    badge: "🔹"

  - key: Beta
    badge: "⚒️"

  - key: Music
    badge: "🎵"
    display: "Music Client"
    section: true

  - key: Reader
    badge: "📖"
    display: "Reader"
    section: true
```

### ClientType Fields

| Field     | Type   | Required | Description                                                                                 |
|-----------|--------|----------|---------------------------------------------------------------------------------------------|
| `key`     | String | Yes      | A unique identifier for this type (must match anything placed in a client’s `types` list). |
| `badge`   | String | No       | An emoji or short text snippet for the generated badge.                                     |
| `display` | String | No       | A custom heading to display. Falls back to `key` if not provided.                           |
| `section` | Bool   | No       | If `true`, the generator creates a “By Type” section for this category.                     |

> **Note**  
> `Official` and `Beta` are special keys in the code. They are used to produce extra badges if a client has `official: true` or `beta: true`. They also appear in the final “legend” of recognized badges.

---

## 4. How the Generator Uses the YAML

1. **Read Clients**  
   The generator loads each client’s data, determining defaults for `official` (if `oss` is under GitHub’s `jellyfin/`) and `price.free` (true if `oss` is set).

2. **Group by Environment**  
   The generator builds a table for each environment (the `targets` groups).  
   - A top-level heading for the group (e.g., **“🌎 Browser-Based”**).  
   - Subheadings for each item in `has`.  
   - Lists the clients that match `target: [subheading name]` in a table.

3. **Sort Clients by Name**  
   Each environment’s table is sorted alphabetically by client name.

4. **Generate Type Sections**  
   For each `ClientType` with `section: true`, the generator creates a new table grouping. Again, it sorts by name and places those matching clients.

5. **Add a Badge Legend**  
   Finally, the generator includes a list of recognized badges from all `types`—displaying the `key` (or `display`) plus the `badge` in a simple list.

---

## 5. Adding or Modifying Entries

**To add a new client**:
1. Add a YAML object under `clients`.
2. Specify at least `name`, `targets`, and `downloads`.
3. (Optionally) Set `oss`, `website`, `official`, `beta`, `price`, or `types` as needed.
4. If the client’s `targets` includes a new platform not in `targets`, you must also define it under `targets` → a new or existing group.

**To add new categories**:
1. Add an entry to `types` with a `key` matching the desired category name in a client’s `types` list.
2. (Optionally) add a `badge` or set `section: true` to generate a new “By Type” section in the Markdown.

**To add new downloads**:
1. In the `downloads` array for the client, add another item with a supported `type`.
2. Provide the necessary fields for that `type` (e.g., `owner`, `repo` for `github`).

---

## 6. Full Example

Below is a trimmed excerpt from the actual `clients.yaml` to illustrate the structure. Notice how multiple clients are listed, each with a variety of download entries:

```yaml
clients:
  - name: "Jellyfin Media Player"
    targets: [ Windows, Linux, macOS ]
    oss: https://github.com/jellyfin/jellyfin-media-player
    official: true
    downloads:
      - type: github
        owner: jellyfin
        repo: jellyfin-media-player
      - type: flathub
        package: com.github.iwalton3.jellyfin-media-player

  - name: "Swiftfin"
    targets: [ iOS, AppleTV ]
    oss: https://github.com/jellyfin/swiftfin
    official: true
    beta: true
    downloads:
      - type: app-store
        id: "1604098728"

targets:
  - key: Browser
    display: "🌎 Browser-Based"
    has:
      - name: Browser
        mapped: Browser

  - key: Desktop
    display: "💻 Desktop"
    has:
      - name: Windows
        mapped: Windows
      - name: Linux
        mapped: Linux
      - name: macOS
        mapped: macOS

types:
  - key: Official
    badge: "🔹"

  - key: Beta
    badge: "⚒️"

  - key: Music
    badge: "🎵"
    display: "Music Client"
    section: true
```

When run through the Markdown generator, the result includes sections by environment (Desktop, Browser, etc.), and a “By Type” section for “Music Client” if any client sets `types: [ Music ]`.
