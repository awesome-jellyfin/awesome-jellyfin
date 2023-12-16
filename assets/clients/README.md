# Jellyfin Client YAML Configuration Schema

The schema provides detailed documentation for constructing a YAML configuration file used by the [Client Markdown Generator](https://github.com/awesome-jellyfin/clients-md-generator). 
The YAML file contains three main sections: `icons`, `targets`, and `clients`.

## `clients` Section

Lists client definitions compatible with Jellyfin.

### Client Definition

Each client in the `clients` list has fields detailing its specifics.

| Field              | Type             | Required | Description                                                                           |
|--------------------|------------------|----------|---------------------------------------------------------------------------------------|
| **`name`**         | String           | Yes      | Name of the client.                                                                   |
| **`targets`**      | List[String]     | Yes      | Platforms supported (e.g., iOS, Android, Windows).                                    |
| `oss`              | String           | No       | URL to the open-source repository, if available.                                      |
| `official`         | Boolean          | No       | Marks the client as an official Jellyfin client (defaults inferred).                  |
| `beta`             | Boolean          | No       | Marks the client as being in beta.                                                    |
| `website`          | String           | No       | Official website URL for the client.                                                  |
| `price`            | Price Object \*  | No       | Specifies if the client is free, paid, or both. Default is free if `oss` is provided. |
| **`downloads`**    | List[Hoster]     | Yes      | List of hosters where the client can be downloaded.                                   |
| `types`            | List[String]     | No       | A list of strings representing additional client categories or features.              |

The `types` field within a client's definition is an optional list of strings that provides additional classification for the client based on its functionality or use case. This can be particularly useful for denoting special features or categories that the client falls under, such as 'Music' for music-specific clients or other identifiers for unique client types.

#### \*) Price Definition
| Field  | Type    | Required | Description                                      |
|--------|---------|----------|--------------------------------------------------|
| `free` | Boolean | No       | Indicates if the client can be downloaded for free. Default is `true` if `oss` is provided. |
| `paid` | Boolean | No       | Indicates if there is a paid version of the client.                        |

#### Hoster Definition
| Field     | Type   | Required | Description                                           |
|-----------|--------|----------|-------------------------------------------------------|
| `icon`    | String | No       | Key representing the icon to be displayed.            |
| `icon-url`| String | No       | URL to a custom icon.                                 |
| `text`    | String | No       | Text displayed if no icon is used.                    |
| `url`     | String | Yes      | Where the client can be downloaded (mandatory).       |

---

## `icons` Section

This section defines a map of icon keys to various representations for use next to client download links in the markdown output.

```yaml
icons:
  key:
    light: "path/to/light-mode/icon.png"
    dark: "path/to/dark-mode/icon.png"
    single: "path/to/icon.png"
    text: Icon Description
```

### Icon Definition

Each key within the `icons` section represents an icon identifier. Icon objects can have various representations and descriptions.

| Field   | Type   | Required       | Description                                                   |
|---------|--------|----------------|---------------------------------------------------------------|
| `light` | String | If `dark` set  | Path to the icon image for light mode (optional).             |
| `dark`  | String | If `light` set | Path to the icon image for dark mode (optional).              |
| `single`| String | No             | Path to the icon image when no mode-specific icon is used.    |
| `text`  | String | No \*          | Description text displayed if no icon image is used.          |

\*) If no image provided, `text` is required.

## `targets` Section

Targets categorize clients into platform- or environment-based groups.

```yaml
targets:
  - key: Browser
    ...
```

### Target Group Definition

Each entry within the `targets` list represents a group of platforms or environments with the following attributes:

| Field     | Type   | Required | Description                                      |
|-----------|--------|----------|--------------------------------------------------|
| `key`     | String | Yes      | Unique identifier for the target group.          |
| `display` | String | Yes      | Display name, commonly with an emoji icon.       |
| `has`     | List   | Yes      | A list of individual target platform entries.    |

### Target Definition

Each `has` list entry within a `TargetGroup` object corresponds to a specific platform or environment.

| Field    | Type   | Required | Description                                                         |
|----------|--------|----------|---------------------------------------------------------------------|
| `name`   | String | Yes      | Target name used in the `clients` section's `targets` field.        |
| `mapped` | String | Yes      | Human-friendly name corresponding to the target name.               |

---

## Tips for Adding New Entries

To add new platforms or icons, define them in the `targets` or `icons` sections:

```yaml
icons:
  new-icon-key:
    light: "assets/clients/icons/new-icon-light.png"
    dark: "assets/clients/icons/new-icon-dark.png"
    text: "New Icon Description"

targets:
  - key: NewPlatform
    display: "🆕 New Platform"
    has:
      - name: NewPlatform # simple key for defining client targets (target: [Browser, ...])
        mapped: "The New Platform Display Name" # display name for the target in the generated Markdown document
```

Reference these new identifiers when creating a client entry:

```yaml
- name: "New Jellyfin Client"
  targets: [NewPlatform]
  oss: https://github.com/your-username/new-jellyfin-client
  official: false
  beta: false
  website: https://newclient.example.com/
  types: [ Music ]
  price:
    free: true
    paid: false
  downloads:
    - icon: new-icon-key
      url: https://example.com/client-download
```
