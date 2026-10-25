# `clients.d`

> [!IMPORTANT]
> **Please do not add your client here unless we ask you to.**
> New clients go into [`clients.yaml`](../clients.yaml) like every other entry. If you open a pull request that adds a new file here without being asked, we will ask you to move the client to `clients.yaml`.

## What is this directory for?

Each file here holds one client that its developers maintain themselves. They get a file of their own to keep up to date (new platforms, download links and so on) without touching the big shared `clients.yaml`.

When `CLIENTS.md` is generated, these files are merged with `clients.yaml`, and the clients show up in the list like any other. Targets and types live only in `clients.yaml`. If your client needs a new target, add it there in the same pull request.

If you maintain a client and think it should live here, open an issue and ask.

## File format

Each file starts with an `owners` field listing the GitHub handles of the client's maintainers / people that added the client to the list, 
followed by a `clients` list with the same shape as the `clients` section of `clients.yaml` (see the [format documentation](../README.md)):

```yaml
# yaml-language-server: $schema=../schema.json
owners:
  - my-github-handle
  - co-maintainer

clients:
  - name: "My Client"
    targets: [Android, iOS]
    oss: https://github.com/me/my-client
    downloads:
      - type: github
        owner: me
        repo: my-client
```
