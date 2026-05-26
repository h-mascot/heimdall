#!/usr/bin/env bash
# Install the Heimdall CLI entrypoint as `skill-scan`.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="${1:-$HOME/.local/bin}"
TARGET="$BIN_DIR/skill-scan"

mkdir -p "$BIN_DIR"
ln -sf "$ROOT/scripts/skill-scan.py" "$TARGET"
chmod +x "$ROOT/scripts/skill-scan.py"

printf 'Installed skill-scan -> %s\n' "$TARGET"
if ! command -v skill-scan >/dev/null 2>&1; then
  printf 'Note: %s is not on PATH for this shell. Add it or run: export PATH="%s:$PATH"\n' "$BIN_DIR" "$BIN_DIR" >&2
fi
