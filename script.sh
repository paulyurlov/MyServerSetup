#!/bin/bash

user=$(whoami)
echo "Hi, $user! Please enter your password on the next step"

sudo apt update
sudo apt upgrade

# Setup fish shell as default
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
chsh -s /usr/bin/fish

# Install noip DUC
sudo apt install gcc g++ make build-essential
sudo -s
cd /usr/local/src/
wget http://www.noip.com/client/linux/noip-duc-linux.tar.gz
tar xf noip-duc-linux.tar.gz
cd noip-2.1.9-1/
make install
/usr/local/bin/noip2 -C
/usr/local/bin/noip2

# Reboot part
read -n 1 -p "Do uou want to reboot to apply settings (y/n)? " answer
printf "\n\n"
if [[ $answer == "y" ]]; then
    echo "Rebooting in 3 seconds"
    sudo reboot -f
else
    echo "No reboot"
fi
