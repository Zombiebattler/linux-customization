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

#### Installation

```bash
curl -fsSL https://raw.githubusercontent.com/Zombiebattler/linux-customization/main/install-zsh.sh -o install-zsh.sh

chmod +x install-zsh.sh

./install-zsh.sh
```
#
#

## update_zshrc.sh

This is a simple Bash script that updates the `.zshrc` file on all my systems.

#### Installation

```bash
curl -fsSL https://raw.githubusercontent.com/Zombiebattler/linux-customization/main/update_zshrc.sh -o update_zshrc.sh

chmod +x update_zshrc.sh
```

You can either update manually or create a cron job.



#
#

## flatpak-syslink.sh

This Bash script creates symbolic links from Flatpak applications to /usr/bin so that they can be found and launched in dmenu (under i3 or other minimalist window managers).

#### Installation

```bash
curl -fsSL https://raw.githubusercontent.com/Zombiebattler/linux-customization/main/flatpak-syslink.sh -o flatpak-syslink.sh

chmod +x flatpak-syslink.sh
```

#
#

## software / tools.sh (BETA)

Script to automatically install useful tools.

- `nmap`
- `zenmap`
- `wireshark`
- `aircrack-ng`
- `macchanger`
- `hashcat`
- `bully`
- `hcxtools`
- `wifite`
- `sqlmap`
- `sherlock`
- `hashid`
- `airgeddon`