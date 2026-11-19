#!/usr/bin/env bash
# Regenerates SOURCE.sha256 for the files library repositories vendor.
set -euo pipefail
cd "$(dirname "$0")/.."
{ printf '%s\n' .gitignore Cargo.lock Cargo.toml LICENSE README.md
  find include src tests -type f | LC_ALL=C sort; } | while read -r file; do shasum -a 256 "$file"; done > SOURCE.sha256
