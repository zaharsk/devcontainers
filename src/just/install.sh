#!/usr/bin/env bash
set -euo pipefail

echo "Activating feature 'just'"

ARCH="$(uname -m)"
DEST=/usr/local/bin

TAG=""

if [[ "${JUST_VERSION}" != "latest" ]]; then
    TAG="--tag ${JUST_VERSION}"
fi

curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to ${DEST} ${TAG}

if [[ "${LSP_VERSION}" == "none" ]]; then
    echo "Skipping just-lsp installation"
    exit 0
fi

if [[ -z "${LSP_VERSION}" || "${LSP_VERSION}" == "latest" ]]; then
    LSP_VERSION="$(curl -fsSL https://api.github.com/repos/terror/just-lsp/releases/latest | jq -er .'tag_name')"
fi

DOWNLOAD_URL="https://github.com/terror/just-lsp/releases/download/${LSP_VERSION}/just-lsp-${LSP_VERSION}-${ARCH}-unknown-linux-musl.tar.gz"

TMP_DIR="$(mktemp -d)"

curl -fsSL -o "${TMP_DIR}/just-lsp.tar.gz" "${DOWNLOAD_URL}"

tar -xzf "${TMP_DIR}/just-lsp.tar.gz" -C "${TMP_DIR}"

install -m 755 \
    "${TMP_DIR}/just-lsp" \
    "${DEST}/just-lsp"

rm -rf "${TMP_DIR}"

echo "'just' feature has been activated"
