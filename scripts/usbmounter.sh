#!/bin/bash
DISK=/dev/sdb1
DIR=/run/media/usb
lsblk
if [[ -b  "$DISK" ]]; then 
	echo "disk exists"
	if [[ ! -e $DIR ]]; then
		sudo mkdir -p $DIR
	elif [[ ! -d $DIR ]]; then
		echo "$DIR already exists but is not a directory" 1>&2
	fi
	sudo mount $DISK $DIR
	else echo "disk does not exist"
fi



