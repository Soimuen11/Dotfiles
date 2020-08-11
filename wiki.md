# MY PERSONAL WIKI

Starting today, June 4th 2020, this file is a collection of all the issues I
have faced and will face on my Linux machine. It is still incomplete, since I
have encountered many many issues, but it shall grow over time from this day
forth.

## df : /run/user/1000 permission denied

systemctl --user stop xdg-document-portal.service
(then disable so it doesn't restart on next boot)

## How to mount android phones in Linux

1. Install simple-mtpfs (from the AUR if you are running Arch Linux)
2. Create Android/ directory in your home/
3. Run : simple-mtpfs -o enable-move --device 1 Android/ 
(1 being the device ID)
4. Unmount with : fusermount -u Android/

## If mouse stops working

+ sudo modprobe -r psmouse (kill mouse kernel module)
+ sudo modprobe psmouse (restart mouse kernel module)
+ use my script called "mouse" which does exactly that

## Display keystrokes during screencast

+ screenkey
+ to install it -> pacman -Ss screenkey OR yay -S screenkey

## Emulating console games

1. nds -> desmume
2. gba -> vbam
3. psp -> ppsspp
4. wii-u -> decaf OR cemu+wine
5. pc -> wine
6. wii + gamecube -> dolphin

## Easily style termite terminal

+ termite-style (see on github)
+ https://github.com/adi1090x/termite-style

## Download videos from youtube

+ youtube-dl
+ youtube-view to watch yt videos directly in terminal
(you need an API to use youtube-view)

## Games on Linux

+ Wine
+ PlayOnLinux
+ Steam

## Concatenating pdfs

+ yay -S pdf-append

## Regular expressions basics

+ . - any one character
+ \* - Match any number of previous (includin 0)
+ \+ - Match any number of previous
+ $ - End of the line
+ ^ - Beginning of the line
+ \S - any non-whitespace character
+ \s - any whitespace character
+ ? - optional
+ [a-z] - any lowercase letter
+ [A-Z] - any uppercase letter
+ [A-Za-z] - any letter
+ [0-9] - any number
+ \ escape something

+ Examples :
	- grep "something" file
	- grep "^s" file -> any line starting wit lowercase s in given file

## Useful tools
1. neofetch
2. image viewer = sxiv
3. pdf viewer = zathura
(don't forget to download sth to read pdfs along with zathura)
4. neomutt
5. ffmpeg

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

+ check filesystem
fsck -N /dev/sd?

+ Format with vFat File System
sudo mkfs.vfat /dev/sdc1

+ Format with NTFS File System
sudo mkfs.ntfs /dev/sdc1

+ Format with EXT4 File System
sudo mkfs.ext4 /dev/sdc1

## Removing sensitive data from a git repo
+ https://help.github.com/en/github/authenticating-to-github/removing-sensitive-data-from-a-repository

## Great ls commands

+ lsusb
+ lscpu
+ lspci

## Windows (OS) list of commands
https://www.lifewire.com/list-of-command-prompt-commands-4092302

## Customize bash
https://wiki.archlinux.org/index.php/Bash/Prompt_customization

## Learn AWK
https://www.tutorialspoint.com/awk/awk_basic_examples.htm

## Learn AWS
https://www.tutorialspoint.com/amazon_web_services/amazon_web_services_cloud_computing.htm

## VPS 
[Virtual Private Server]
+ Linode
+ AWS
+ Google
+ Digital Ocean
+ Vultr

## Buying a domain name
+ epik

## Installing brave
+ yay -S brave-bin

## copy text from vim to an external program
"+y

## Installing android in Vbox
+ Change motherboard to PS/2 Mouse in System tab
+ Change Processors to 2+
+ Change Display to 3d and VboxSVGA

## FFMPEG

### webcamming
ffmpeg -y -i /dev/video0 out.mkv

### determining available resolutions
xrandr

### find size and offset of particular window to capture
xwininfo

### find out which pulseaudio sound sources exist 
pactl list sources
to record, find the input source (not output)

### The entire ffmpeg command.

ffmpeg -video_size 1366x768 -framerate 25 -f x11grab -i :0.0 -f pulse -ac 2 -i 1 output.mkv -async 1 -vsync 1

+ video_size 1920×1080: Sets the size of the video capture. This is the value we used xrandr to find.
+ framerate 25: Sets the frames per second value.
+ f x11grab: Force the video format to a specific type. Here we’re setting the input format to the output of your X server.
+ i :0.0: This specifies the video input will come from the main screen.
+ f pulse: Sets the expected format to be PulseAudio.
+ ac 2: Set two audio channels
+ i 1: Take audio input from PulseAudio source #1. This is the value we used pactl to discover.
+ output.mkv: The name of the file we wish to create.
+ async 1: Set the audio sync method. This is a deprecated parameter, but we’re using it here to avoid error messages that can be ignored.
+ vsync 1: set the video sync method. This is a deprecated parameter, but we’re using it here to avoid error messages that can be ignored.

### Extrat audio from video
ffmpeg -i sample.avi -q:a 0 -map a sample.mp3

### Capture only video, no audio
ffmpeg -video_size 1366x768 -framerate 25 -f x11grab -i :0.0 output.mkv -vsync 1

### Directory
If you don't specify a directory to save the video, it will be saved in the directory ffmpeg was launched from.

### Converting files
ffmpeg -i output.mkv output.mp4
general formula : ffmpeg -i output.oldformat output.wantedformat

### Add background music
ffmpeg -i arch-install.mp4  -i archinstall-soundtrack.mp4 -c copy -map 0:v:0 -map 1:a:0 output2.mp4

### concatenating files
create a list of files in a FILE
ex : filename
	file "file1_path"
	file2 "file1_path"
	file3 "file1_path"
run : ffmpeg -f concat -safe 0 -i /home/soimuen/Downloads/FILENAME -c copy output.webm
### cutting videos
ffmpeg -ss 00:01:00 -i input.mp4 -to 00:02:00 -c copy output.mp4

### Burning subs to video
NOTE: This solution "burns the subtitles" into the video, so that every viewer of the video will be forced to see them.

Use the libass library (make sure your ffmpeg install has the library in the configuration --enable-libass).

First convert the subtitles to .ass format:

ffmpeg -i subtitles.srt subtitles.ass
Then add them using a video filter:

ffmpeg -i mymovie.mp4 -vf ass=subtitles.ass mysubtitledmovie.mp4

### Info source
https://www.howtogeek.com/446706/how-to-create-a-screencast-on-linux/
ffmpeg.org
stackexchange

## Fuzzy Finders
Find can be a slow command
 + Use broot instead
 + There's also fzf which is quite popular and can be used together with bfs.

## Modifying images
+ ImageMagick (cli tool); imagemagick.org -> official site; they also have a github page
+ canva.com -> very quick and effective for youtube thumbnails
+ gimp -> free software, equivalent to photoshop
