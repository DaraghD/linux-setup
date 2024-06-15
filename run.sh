#!/bin/bash

printf "Linux setup\n \n"
echo "Installing git, ansible and updating"
 if [ -x "$(command -v apt)" ]; then
     sudo apt upgrade 
     sudo apt install -y git ansible

 elif [ -x "$(command -v pacman)" ]; then
     sudo pacman -Syu --noconfirm
     sudo pacman -S --noconfirm git ansible
 else
     echo "Not arch or ubuntu."
     exit 1
 fi

mkdir ~/.linux-setup
git clone https://github.com/daraghd/linux-setup ~/.linux-setup
ansible-playbook ~/.linux-setup/main.yml
