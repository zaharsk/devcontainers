#!/usr/bin/env bash
set -euo pipefail

echo "Activating feature 'git_flow_next'"

DEST=/usr/local/bin

OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m)"

case "$ARCH" in
    x86_64) ARCH="amd64" ;;
    aarch64|arm64) ARCH="arm64" ;;
    i386|i686) ARCH="386" ;;
esac


if [[ -z "${GIT_FLOW_VERSION}" || "${GIT_FLOW_VERSION}" == "latest" ]]; then
    GIT_FLOW_VERSION="$(curl -fsSL https://api.github.com/repos/gittower/git-flow-next/releases/latest | jq -er .'tag_name')"
fi

DOWNLOAD_URL="https://github.com/gittower/git-flow-next/releases/download/${GIT_FLOW_VERSION}/git-flow-next-${GIT_FLOW_VERSION}-${OS}-${ARCH}.tar.gz"

TMP_DIR="$(mktemp -d)"

curl -fsSL -o "${TMP_DIR}/git-flow-next.tar.gz" "${DOWNLOAD_URL}"

tar -xzf "${TMP_DIR}/git-flow-next.tar.gz" -C "${TMP_DIR}"

ls -la "${TMP_DIR}/git-flow-${GIT_FLOW_VERSION}-${OS}-${ARCH}"

install -m 755 \
    "${TMP_DIR}/git-flow-${GIT_FLOW_VERSION}-${OS}-${ARCH}" \
    "${DEST}/git-flow"

rm -rf "${TMP_DIR}"

echo "'just' feature has been activated"