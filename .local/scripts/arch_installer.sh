#!/bin/bash
### Warning!
### This script is meant to be run as root!

# The installation begins with:
# 1. setting the keyboard layout: keep the default
# 2. verify the boot mode
# 3. connect to the internet

# CURL THE INSTALLATION SCRIPT

# 4. Update the system clock
# timedatectl set-ntp true
# 5. sfdisk to partition the disk
	# do you want root // home // boot partitions -> prompt user
	# ask for size of partitions in GB
	# create the partitions
# 6. Format the partitions
# 7. Mount the file systems to /mnt
# mount /dev/root_partition /mnt
# swapon /dev/swap_partition
# 8. Select the mirrors
	# delete everything in the file which is not related to France / Italy
# 9. Install essential packages
# 10. Configure the system
	# genfstab -U /mnt >> /mnt/etc/fstab

# CHROOT
# arch-chroot /mnt
# select time zone
	# ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
# Run hwclock to generate /etc/adjtime:
	# hwclock --systohc
# Edit /etc/locale.gen and uncomment en_US.UTF-8 UTF-8 and other needed locales. Generate the locales by running:
	# locale-gen
# Create the locale.conf file, and set the LANG variable accordingly:
	# LANG=en_US.UTF-8
# create the hostname file and enter a hostname (e.g. madlibrarian)
# Add matching entries to hosts
	# 127.0.0.1	localhost
	# ::1		localhost
	# 127.0.1.1	myhostname.localdomain	myhostname
# Set root password
	# passwd
# Select a boot loader

### Updating the system & re-installing fave packages
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git vim neovim libreoffice thunderbird neomutt newsboat vifm xorg xorg-xinit zsh sudo pavucontrol alsa networkmanager

# Creating a user & Giving it a /home & adding it to groups
read -p "Enter username: " username
useradd -m -G wheel,sudo,audio,video $username
echo 'created a user called' $username && echo 'added it to groups: audio, video, wheel, sudo'

# GETTING MY DOTFILES/ BACK
cd /home/$username/
git clone https://github.com/Soimuen11/Dotfiles.git
echo 'cloned Soimuen11s Dotfiles in /home/'$username

# SET UP THE ARCHITECTURE OF /HOME DIRECTORY
mkdir -v -p /home/$username/.local 
mkdir -v -p ~home/$username/.local/bin
mkdir -v -p ~home/$username/.local/scripts
mkdir -v -p ~home/$username/.local/share
mkdir -v -p ~home/$username/.local/repos
mkdir -v -p ~home/$username/Documents/Projects
mkdir -v -p ~home/$username/Downloads/TBS-Movies
mkdir -v -p ~home/$username/Downloads/TBS-Musics
mkdir -v -p ~home/$username/Downloads/TBS-Pictures
mkdir -v -p ~home/$username/Downloads/PDFS

# Setting up symbolic links for my personal scripts
ln -s ~/.local/scripts/mystery.sh ~/.local/bin/mystery
echo 'created symlink for mystery.sh'
ln -s ~/.local/scripts/generator.sh ~/.local/bin/qutegen
echo 'created symlink for generator.sh'
ln -s ~/.local/scripts/translator.sh ~/.local/bin/translator
echo 'created symlink for translator.sh'
ln -s ~/.local/scripts/mouse.sh ~/.local/bin/mouse
echo 'created symlink for mouse.sh'
ln -s ~/.local/scripts/usbmounter.sh ~/.local/bin/usbmounter
echo 'created symlink for usbmounter.sh'
ln -s ~/.local/scripts/weather.sh ~/.local/bin/weather
echo 'created symlink for weather.sh'

# Replace the present dotfiles with mine
rm -rv /home/$username/.vim* /home/$username/.zsh* /home/$username/.bash*
cp -rv ~/Dotfiles/.zshrc /home/$username
cp -rv ~/Dotfiles/.Xmodmap /home/$username
cp -rv ~/Dotfiles/.bash/.bashrc /home/$username
cp -rv ~/Dotfiles/.vim ~/Dotfiles/.vimrc /home/$username

# Installing the AUR
cd /home/$username/.local/repos/
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

if [[ $SHELL=/usr/bin/bash ]]; 
	then chsh $username /usr/bin/zsh 
fi

# Other :
	# Add .config folder
	# Set up dwm/qtile window manager
	# Modify /etc sudoers
	# Modify for the whole install of an arch system
	# Modify so that other people can use it
