#!/bin/bash

EXPORT_DIR="/var/lib/flatpak/exports/bin"
TARGET_DIR="/usr/bin"

for BIN in "$EXPORT_DIR"/*; do
  [ -f "$BIN" ] || continue

  APP_ID=$(basename "$BIN")
  LINK_NAME=$(echo "$APP_ID" | awk -F '.' '{print tolower($NF)}')
  LINK_PATH="$TARGET_DIR/$LINK_NAME"

  if [ -L "$LINK_PATH" ] && [ "$(readlink -f "$LINK_PATH")" = "$BIN" ]; then
    echo "Symlink for $LINK_NAME already exists, skip."
  elif [ -e "$LINK_PATH" ]; then
    echo "⚠️  $LINK_PATH already exists and is not a suitable link, skip.."
  else
    echo "🔗 Create symlink: $LINK_PATH → $BIN"
    sudo ln -s "$BIN" "$LINK_PATH"
  fi
done
