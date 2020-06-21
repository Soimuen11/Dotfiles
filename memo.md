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

## easily style termite terminal

termite-style (see on github)
https://github.com/adi1090x/termite-style

## Download videos from youtube

youtube-dl
youtube-view to watch yt videos directly in terminal

## Games on Linux

Wine
PlayOnLinux

## Concatenating pdfs

yay -S pdf-append

## Regular expressions basics

. - any one character
\* - Match any number of previous (includin 0)
\+ - Match any number of previous
$ - End of the line
^ - Beginning of the line
\S - any non-whitespace character
\s - any whitespace character
? - optional
[a-z] - any lowercase letter
[A-Z] - any uppercase letter
[A-Za-z] - any letter
[0-9] - any number
\ escape something

examples :
- grep "something" file
- grep "^s" file -> any line starting wit lowercase s in given file

## Useful tools
1. neofetch
2. image viewer = sxiv
3. pdf viewer = zathura
(don't forget to download sth to read pdfs along with zathura)

## Networking
1. nmtui (this is the one you want)
on archlinux, run : pacman -S networkmanager
2. nmcli dev wifi
3. nmcli dev wifi connect APname password
4. nmap +ip a+ nmap -sn 10.1.0.85/24
5. wireshark
6. nslookup
7. wifite2
8. ifconfig
9. ip a
10. lscpi

## Formating a flashdrive

check filesystem
fsck -N /dev/sd?

+ Format with vFat File System
sudo mkfs.vfat /dev/sdc1

+ Format with NTFS File System
sudo mkfs.ntfs /dev/sdc1

+ Format with EXT4 File System
sudo mkfs.ext4 /dev/sdc1

## Removing sensitive data from a git repo
https://help.github.com/en/github/authenticating-to-github/removing-sensitive-data-from-a-repository
