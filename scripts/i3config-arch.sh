#bin/bash

# variables
ZHS_CONFIG_URL="https://raw.githubusercontent.com/Zombiebattler/linux-customization/refs/heads/main/configs/zshrc"
I3_Windows_URL="https://raw.githubusercontent.com/Zombiebattler/linux-customization/refs/heads/main/configs/i3_windows.conf"
I3_LOCK_URL="https://raw.githubusercontent.com/Zombiebattler/linux-customization/refs/heads/main/configs/i3_lock.conf"



echo -e "\nUpdate System & Installing Software\n"

sudo pacman -Syu
sudo pacman -S cowsay zsh feh picom kitty mtr curl




echo -e "\nInstalling yay & aur packages\n"

sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay
yay i3lock-color



echo -e "\nInstalling Oh-my-ZSH\n"

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"
cp "$HOME/.zshrc" "$HOME/.zshrc.backup"
curl -fsSL "$ZHS_CONFIG_URL" -o "$HOME/.zshrc"



echo -e "\nConfigure Kitty Termianl\n"

mkdir -p $HOME/.config/kitty
touch $HOME/.config/kitty/kitty.conf
echo 'shell zsh' >> $HOME/.config/kitty/kitty.conf



echo -e "\nConfigure i3 Windows\n"

curl -fsSL "$I3_Windows_URL" -o "$HOME/.config/i3/i3_windows.conf"
echo "include $HOME/.config/i3/i3_windows.conf" >> ~/.config/i3/config



echo -e "\nConfigure i3lock\n"

mkdir -p $HOME/.config/i3/scripts/
curl -fsSL "$I3_LOCK_URL" -o "$HOME/.config/i3/scripts/lock"
chmod +x "$HOME/.config/i3/scripts/lock"
echo "bindsym \$mod+x exec $HOME/.config/i3/scripts/lock" >> "$HOME/.config/i3/config"