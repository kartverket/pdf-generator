#!/bin/sh
set -eu

exec "${CHROMIUM_ORIGINAL_BIN_PATH:-/usr/bin/chromium}" "$@" \
  --disable-background-networking \
  --disable-component-update \
  --disable-domain-reliability \
  --disable-sync
