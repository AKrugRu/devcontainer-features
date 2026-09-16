# Install ansible and molecule to devcontainer (ansible-molecule)

Добавляем в devcontainer ansible и molecule

## Example Usage

```json
{
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/devcontainers/features/python:1": { "toolsToInstall": "pip" },
    "ghcr.io/AKrugRu/devcontainer-features/ansible-molecule:1": {}
  }
}
```

`installsAfter` is **ordering only** — the `python` feature must be listed in `features` for `pip` to be available at install time. Without it, the install fails with a clear "python3 -m pip not found" error.

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| ansible_version | Укажите версию для установки | string | latest |
| molecule_version | Укажите версию для установки | string | latest |

## Customizations

### VS Code Extensions

- `redhat.ansible`


### Zed users

Zed's native dev container implementation (since v0.231.1) has known issues installing features from the `features` block — see [zed-industries/zed#56608](https://github.com/zed-industries/zed/issues/56608). Until that's fixed, this feature may not install correctly inside Zed. Workarounds: (a) use a custom Dockerfile via `"build": { "dockerfile": "Dockerfile" }`, (b) use `devcontainer up` from the CLI and connect Zed over SSH, or (c) wait for the upstream fix.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/AKrugRu/devcontainer-features/blob/main/src/ansible-molecule/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
