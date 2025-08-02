#!bin/bash

ZHS_CONFIG_URL="https://raw.githubusercontent.com/Zombiebattler/linux-customization/refs/heads/main/configs/zshrc"

# standard

sudo apt update
sudo apt upgrade -y
sudo apt install git zsh nala unzip cowsay jp2a -y


# Nerdfonts

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip
unzip Meslo.zip -d ~/.local/share/fonts/
fc-cache -fv
rm Meslo.zip


# oh-my-zsh + plugins & config >

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM}/themes/powerlevel10k"

cp "$HOME/.zshrc" "$HOME/.zshrc.backup"
curl -fsSL "$ZHS_CONFIG_URL" -o "$HOME/.zshrc"


# Done.

echo ""
echo "✅ Done"
echo "⚠️ First, configure the <Meslo Nerd Font> font in your terminal, then run <source .zshrc>"
echo ""
echo "by by :)"
