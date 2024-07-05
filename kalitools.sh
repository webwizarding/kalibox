#!/bin/bash

# Update and upgrade the system
sudo apt-get update -y
sudo apt-get upgrade -y

# Install commonly used tools in tryhackme attack boxes

# Install tools from default repositories
sudo apt-get install -y nmap gobuster dirb nikto metasploit-framework sqlmap john hydra burpsuite wireshark aircrack-ng hashcat netcat exploitdb theharvester recon-ng enum4linux mimikatz responder setoolkit wpscan beef-xss ettercap-graphical dnsenum masscan snmpwalk ssh-audit

# Install tools from GitHub
if [ ! -d "Sublist3r" ]; then
    git clone https://github.com/aboul3la/Sublist3r.git
    cd Sublist3r
    pip install -r requirements.txt
    cd ..
fi


if [ ! -d "BloodHound" ]; then
    git clone https://github.com/BloodHoundAD/BloodHound.git
    cd BloodHound
    npm install
    npm run linuxbuild
    cd ..
fi


if [ ! -d "Empire" ]; then
    git clone https://github.com/EmpireProject/Empire.git
    cd Empire
    ./setup/install.sh
    cd ..
fi

if [ ! -d "recon-ng" ]; then
    git clone https://github.com/lanmaster53/recon-ng.git
    cd recon-ng
    sudo python3 setup.py install
    cd ..
fi

if ! command -v mimikatz &> /dev/null
then
    sudo apt-get install -y wine
    if [ ! -d "mimikatz" ]; then
        git clone https://github.com/gentilkiwi/mimikatz.git
        cd mimikatz/Win32
        make
        cd ../x64
        make
        cd ../..
    fi
fi

sudo apt-get clean

echo "All tools have been installed successfully."
