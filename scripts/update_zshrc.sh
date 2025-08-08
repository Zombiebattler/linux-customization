#!/bin/bash
# zshrc update script.
ZHS_CONFIG_URL="https://raw.githubusercontent.com/Zombiebattler/linux-customization/refs/heads/main/configs/zshrc"
cp "$HOME/.zshrc" "$HOME/.zshrc.$(date +%F).backup"
curl -fsSL "$ZHS_CONFIG_URL" -o "$HOME/.zshrc"
