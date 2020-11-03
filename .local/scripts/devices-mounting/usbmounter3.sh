#!/bin/bash

# USING DMENU TO DETECT DEVICES AND MOUNT/UNMOUNT THEM


#devices
devices=("/dev/sdb1" "/dev/sdc1" "/dev/sdd1" "/dev/sde1")

#mounting dirs
dirs=("usb" "usb2" "usb3" "usb4")

# setup environment
for dir in "${dirs[@]}"
do
	if [[ ! -d /run/media/$dir ]]; 
	then sudo mkdir /run/media/$dir
		echo "created /run/media/$dir"
	fi
done

for dir in "${dirs[@]}";
do 
	ls /run/media/$dir | dmenu
done
