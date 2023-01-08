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

# Install roboto fonts
sudo apt install fonts-roboto

# Install oh-my-posh and theme

sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip
cp my-posh-config.json ~/.config/fish/
echo "oh-my-posh init fish --config ~/.config/fish/my-posh-config.json | source" >~/.config/fish/config.fish
exec fish
oh-my-posh font install RobotoMono
sudo oh-my-posh font install RobotoMono
sudo cp ~/.local/share/fonts/robotomono-nerd-font-mono/Roboto\ Mono\ Nerd\ Font\ Complete\ Mono.ttf /usr/share/fonts/

# Reboot part
read -n 1 -p "Do uou want to reboot to apply settings (y/n)? " answer
printf "\n\n"
if [[ $answer == "y" ]]; then
    echo "Rebooting in 3 seconds"
    sudo reboot -f
else
    echo "No reboot"
fi
