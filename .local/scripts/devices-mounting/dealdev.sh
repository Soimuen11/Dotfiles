#!/bin/bash

#display available devices
lsblk -lp
dirs=("usb" "usb2" "usb3" "usb4")
devices=("/dev/sdb1" "/dev/sdc1" "/dev/sdd1" "/dev/sde1")

#set up mounting directories
setup () {
	for dir in "${dirs[@]}"
	do
		if [[ ! -d /run/media/$dir ]]; 
			then sudo mkdir /run/media/$dir
			echo "created /run/media/$dir"
		fi
	done
}

#mounting devs in /run/media/usb?
mounting () {
	for dev in "${devices[@]}"
	do
		if [[ -b  "$dev" ]]; 
			then echo "disk exists [$dev]"
			for dir in "${dirs[@]}"
			do
				sudo mount /run/media/$dir
			done
		else echo "disk does not exist [$dev]"
		fi
	done
}

unmounting () {
	for dir in "${dirs[@]}"
	do
		sudo umount /run/media/$dir
	done
}

#set up environment if --setup parameter is specified
#short paramter -s
if [[ $1 = "setup" ]] || [[ $1 = "-s" ]];
	then setup
fi

#mount external devices if -m or --mounter is specified
if [[ $1 = "-m" ]] || [[ $1 = "--mounter" ]];
	then mounting
	#unmount external devices if -u or --unmount is specified
elif [[ $1 = "-u" ]] || [[ $1 = "--unmount" ]]; 
	then unmounting
fi

# possible improvements :
# 3. écouter les événements udev et qui te propose de monter tes clés
# serait nice. 
# 4. si tu peux appeler le script avec un raccourci clavier pour
# de/monter des clés à la volée encore plus nice
# 5. si en plus tu gères les
# cartes sd et les téléphones en mtp nice+++
