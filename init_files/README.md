## Quick setup

### Get latest version

```bash
curl -fsSL https://raw.githubusercontent.com/zaharsk/devcontainers/refs/heads/main/dc-files/version.json | jq .version -r
```

### Init new devcontainer

```bash
TMP_DIR="$(mktemp -d)" &&\
VERSION="$(curl -fsSL https://raw.githubusercontent.com/zaharsk/devcontainers/refs/heads/main/dc-files/version.json | jq -r .version)" &&\
curl -fsSL -o "${TMP_DIR}/dc-files.tar.gz" "https://github.com/zaharsk/devcontainers/archive/refs/tags/dc-files-v${VERSION}.tar.gz"  &&\
tar -xzf "${TMP_DIR}/dc-files.tar.gz" -C "${TMP_DIR}" &&\
mkdir -p .devcontainers &&\
cp -a "${TMP_DIR}/devcontainers-dc-files-v${VERSION}/dc-files/." ./devcontainers/ &&\
rm -rf "${TMP_DIR}"
```
