#!/bin/bash

echo "[+] installing additional software"

sudo apt install -y git python3 python3-pip python3-venv pipx build-essential
sudo -H pipx ensurepath
sudo apt install -y nmap zenmap wireshark aircrack-ng macchanger hashcat bully hcxtools wifite sqlmap sherlock hashid

echo "[+] Install hashid..."
if ! command -v hashid &> /dev/null; then
    echo "[+] Installiere hashid via pipx..."
    sudo -H pipx install hashid
fi

echo "[+] Install Sherlock..."
if ! command -v sherlock &> /dev/null; then
    echo "[+] Installiere Sherlock via pipx..."
    sudo -H pipx install sherlock
fi

# Airgeddon (GitHub)
echo "[+] Install airgeddon..."
if [ ! -d /opt/airgeddon ]; then
  sudo git clone https://github.com/v1s1t0r1sh3r3/airgeddon.git /opt/airgeddon
fi

clear

echo "[+] All tools have been installed!"

echo -e "\n📦 Some Tools overview:"
echo " - sherlock                   -> sherlock <name>"
echo " - nmap                       -> nmap <ip>"
echo " - macchanger                 -> macchanger -h"
echo " - hashcat                    -> hashcat -h"
echo " - wifite                     -> sudo wifite"
echo " - airgeddon                  -> cd /opt/airgeddon && sudo bash airgeddon.sh"
echo " - hashid                     -> hashid <hash>"