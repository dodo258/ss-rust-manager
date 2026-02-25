#!/usr/bin/env bash
# Deprecated compatibility entrypoint.
# Please use ss-rust.sh directly.

set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "[INFO] Shadowsocks-Rust.sh 已废弃，正在转交给 ss-rust.sh ..."
exec bash "${SCRIPT_DIR}/ss-rust.sh" "$@"
