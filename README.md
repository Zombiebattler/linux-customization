# A collection of scripts and configurations that I use

## Install-zsh.sh 

A simple Bash script for installing and configuring ZSH on Debian and Debian-based Linux distros.

### Packages

The following tools will be installed:

- `git`
- `zsh`
- `nala`
- `unzip`
- `cowsay`

### ZSH Extensions & Theme

In addition, the script sets up:

- **Nerd Fonts**
- [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions)
- [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting)
- [`powerlevel10k`](https://github.com/romkatv/powerlevel10k)

### Installation

```bash
curl -fsSL https://raw.githubusercontent.com/Zombiebattler/linux-customization/main/install-zsh.sh -o install-zsh.sh

chmod +x install-zsh.sh

./install-zsh.sh

```