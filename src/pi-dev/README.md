# Add pi.dev agent to devcontainer (pi-dev)

Добавляем в devcontainer агента pi.dev

## Example Usage

```json
{
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/devcontainers/features/node:1": {},
    "ghcr.io/AKrugRu/devcontainer-features/pi-dev:1": {}
  }
}
```

`installsAfter` is **ordering only** — the `node` feature must be listed in `features` for `node`/`npm` to be available at install time. Without it, the install fails with a clear "Node.js or npm not found" error.

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Укажите версию для установки | string | latest |


### Zed users

Zed's native dev container implementation (since v0.231.1) has known issues installing features from the `features` block — see [zed-industries/zed#56608](https://github.com/zed-industries/zed/issues/56608). Until that's fixed, this feature may not install correctly inside Zed. Workarounds: (a) use a custom Dockerfile via `"build": { "dockerfile": "Dockerfile" }`, (b) use `devcontainer up` from the CLI and connect Zed over SSH, or (c) wait for the upstream fix.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/AKrugRu/devcontainer-features/blob/main/src/pi-dev/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
