# Solved issues

Starting today, June 4th 2020, this file is a collection of all the issues I
have faced and will face on my Linux machine. 

## df : /run/user/1000 permission denied

systemctl --user stop xdg-document-portal.service

## How to mount android phones in Linux

Install simple-mtpfs (from the AUR if you are running Arch Linux)

## If mouse stops working

sudo modprobe -r psmouse (kill mouse kernel module)
sudo modprobe psmouse (restart mouse kernel module)

## display keystrokes during screencast

screenkey 
to install it -> pacman -Ss screenkey OR yay -S screenkey

## emulating console games

1. nds -> desmume
2. gba -> vbam
3. psp -> ppsspp
4. wii-u -> decaf OR cemu+wine
5. pc -> wine
6. wii + gamecube -> dolphin
