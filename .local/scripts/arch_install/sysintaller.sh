#!/bin/bash

# RUN THIS BEFORE RE-INSTALLING YOUR SYSTEM!
# pacman -Qe > arch_packages

# UPDATING THE SYSTEM
# & re-installing fave packages
sudo pacman -Syu
sudo pacman -S git 
softwares=$(cat arch_packages)
sudo pacman -S $softwares
# careful :  some packages must be installed with the AUR

# CREATE A USER
# Give it a /home & add it to wheel group
read -p "Enter username: " username
useradd -m -G wheel $username
# let's not forget i still need to modifiy /etc/sudoers

# DOWNLOAD MY DOTFILES FROM GITHUB
cd ~
git clone https://github.com/Soimuen11/Dotfiles.git

# If current shell is /bin/bash, chsh /bin/zsh
if [[ $SHELL=/usr/bin/bash ]]; 
	then chsh $username /usr/bin/zsh 
fi

# Set up architecture
mkdir -v -p ~/.local 
mkdir -v -p ~/.local/bin
mkdir -v -p ~/.local/scripts
mkdir -v -p ~/.local/share
mkdir -v -p ~/.local/repos
mkdir -v -p ~/Documents/Projects
mkdir -v -p ~/Downloads/TBS-Movies
mkdir -v -p ~/Downloads/TBS-Musics
mkdir -v -p ~/Downloads/TBS-Pictures
mkdir -v -p ~/Downloads/PDFS

# Set up symbolic links for my personal scripts
ln -s ~/.local/scripts/mystery.sh ~/.local/bin/mystery
ln -s ~/.local/scripts/generator.sh ~/.local/bin/qutegen
ln -s ~/.local/scripts/translator.sh ~/.local/bin/translator
ln -s ~/.local/scripts/mouse.sh ~/.local/bin/mouse
ln -s ~/.local/scripts/usbmounter.sh ~/.local/bin/usbmounter
ln -s ~/.local/scripts/weather.sh ~/.local/bin/weather

# Replace the present dotfiles with mine
rm -rv ~/.vim* ~/.zsh* ~/.bash*
cp -rv ~/Dotfiles/.zshrc /home/$username
cp -rv ~/Dotfiles/.Xmodmap /home/$username
cp -rv ~/Dotfiles/.bash/.bashrc /home/$username
cp -rv ~/Dotfiles/.vim ~/Dotfiles/.vimrc /home/$username

# Other :
	# Add .config folder
	# Set up qtile window manager
	# Install Lxde
