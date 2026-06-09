#!/usr/bin/env bash

set -ueo pipefail

rm -rf .devcontainer/features
mkdir -p .devcontainer/features

cp -R src/* .devcontainer/features/
cp init_files/.env .devcontainer/