#!/bin/bash

# variables
ZSH_CONFIG_URL="https://raw.githubusercontent.com/Zombiebattler/linux-customization/refs/heads/main/configs/zshrc"
I3_Windows_URL="https://raw.githubusercontent.com/Zombiebattler/linux-customization/refs/heads/main/configs/i3_windows.conf"
I3_LOCK_URL="https://raw.githubusercontent.com/Zombiebattler/linux-customization/refs/heads/main/configs/i3_lock.conf"
I3_CONFIG_URL="https://raw.githubusercontent.com/Zombiebattler/linux-customization/refs/heads/main/configs/config"
I3_STATUS_URL="https://raw.githubusercontent.com/Zombiebattler/linux-customization/refs/heads/main/configs/i3status.conf"

echo -e "\nUpdate System & Installing Software\n"

sudo pacman -Syu
sudo pacman -S cowsay zsh feh picom kitty mtr curl ttf-droid --noconfirm
sudo pacman -S --needed base-devel git --noconfirm
rm -rf yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay
yay i3lock-color --noconfirm



echo -e "\nInstalling Oh-my-ZSH\n"

echo -e "\n\033[31m!!! If you are redirected to the ZSH shell, simply type 'exit' to continue the installation. !!!\033[0m\n"

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"
cp "$HOME/.zshrc" "$HOME/.zshrc.backup"
curl -fsSL "$ZSH_CONFIG_URL" -o "$HOME/.zshrc"



echo -e "\nInstalling New Config Files\n"

mkdir -p "$HOME/.config/i3/scripts"
mkdir -p "$HOME/.config/i3/i3status"

cp "$HOME/.config/i3/config" "$HOME/.config/i3/config.backup"

curl -fsSL "$I3_CONFIG_URL" -o "$HOME/.config/i3/config"
curl -fsSL "$I3_Windows_URL" -o "$HOME/.config/i3/i3_windows.conf"
curl -fsSL "$I3_LOCK_URL" -o "$HOME/.config/i3/scripts/lock"
curl -fsSL "$I3_STATUS_URL" -o "$HOME/.config/i3/i3status/i3status.conf"

chmod +x "$HOME/.config/i3/scripts/lock"
chown $USER:$USER -R "$HOME/.config/i3"



echo -e "\nConfigure Kitty Termianl\n"

mkdir -p "$HOME/.config/kitty"
cat > "$HOME/.config/kitty/kitty.conf" <<EOF
shell zsh
background_opacity 0.5
EOF



echo -e "\nConfigure Picom\n"

mkdir -p "$HOME/.config/picom"
cat > "$HOME/.config/picom/picom.conf" <<EOF
corner-radius = 5;
backend = "glx";
EOF