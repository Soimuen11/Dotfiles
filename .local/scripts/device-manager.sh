#!/bin/bash

# This script is meant to be called either as root or I need to put the
# necessary lines in my /etc/fstab so that I can access devices as a user

# Choose MOUNT or UNMOUNT mode
MODE=$(echo -e 'Mount\nUnmount' | dmenu -p "Action:")
case "$MODE" in
	Mount) 
		# Choose device you wish to mount && mount point
		DEVICE=$(ls /dev/sd* | dmenu -p "Devices:")
		MOUNT_POINT=$(ls /mnt/| dmenu -p "Mount point:")
		st -e sudo mount "$DEVICE" /mnt/"$MOUNT_POINT";;
	Unmount) 
		# Choose which mounted dev you want unmounted
		BUSY_DEV=$(mount | awk '{print $3}' | grep 'mnt' | dmenu -p "Devices:")
		st -e sudo umount "$BUSY_DEV";;
esac
