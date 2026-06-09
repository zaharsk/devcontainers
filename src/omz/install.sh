#!/usr/bin/env bash
set -euo pipefail

usermod --shell "$(which zsh)" vscode
