#!/bin/bash

# 1. Create a user
#add user + give it a /home
#add the new user to sudoers group + wheel + audio + devs

# 2.Update the system 
# sudo pacman -Syu
# sudo apt update
# sudo apt upgrade

# sort & install fave programs with pacman
# ignore AUR packages
pacman -S --needed $(comm -12 <(pacman -Slq | sort) < (sort arch_packages))
# same with yay
yay -S --needed $(comm -12 <(yay -Slq | sort) < (sort arch_packages))

#set up architecture
mkdir -p ~/.local 
mkdir -p ~/.local/bin
mkdir -p ~/.local/scripts
mkdir -p ~/.local/share
mkdir -p ~/.local/repos
mkdir -p ~/Documents/Projects
mkdir -p ~/Downloads/TBS-Movies
mkdir -p ~/Downloads/TBS-Musics
mkdir -p ~/Downloads/TBS-Pictures
mkdir -p ~/Downloads/PDFS

#Download my dotfiles from github
cd ~
git clone https://github.com/Soimuen11/dotfiles.git

#NOT YET WORKING
# if current shell is /bin/bash, chsh /bin/zsh
# current_shell=$SHELL
# if [[$SHELL=/usr/bin/bash]]; 
# 	then chsh $user /usr/bin/zsh 

#Replace the present dotfiles with mine
# vim + shell

