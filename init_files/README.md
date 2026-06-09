## Quick setup

### Get latest version

```bash
curl -fsSL https://raw.githubusercontent.com/zaharsk/devcontainers/refs/heads/main/init_files/version.json | jq .version -r
```

### Init new devcontainer

```bash
TMP_DIR="$(mktemp -d)" &&\
VERSION="$(curl -fsSL https://raw.githubusercontent.com/zaharsk/devcontainers/refs/heads/main/init_files/version.json | jq -r .version)" &&\
curl -fsSL -o "${TMP_DIR}/init_files.tar.gz" "https://github.com/zaharsk/devcontainers/archive/refs/tags/init_files-v${VERSION}.tar.gz"  &&\
tar -xzf "${TMP_DIR}/init_files.tar.gz" -C "${TMP_DIR}" &&\
mkdir -p .devcontainer &&\
cp -a "${TMP_DIR}/devcontainers-init_files-v${VERSION}/init_files/." .devcontainer/ &&\
rm -rf "${TMP_DIR}"
```
