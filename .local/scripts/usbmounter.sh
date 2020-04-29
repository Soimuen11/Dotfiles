#!/bin/bash
DISK1=/dev/sdb1
DIR1=/run/media/usb
DISK2=/dev/sdc1
DIR2=/run/media/usb2
lsblk
if [[ -b  "$DISK1" ]]; then 
	echo "disk exists [sdb1]"
	if [[ ! -e $DIR1 ]]; then
		sudo mkdir -p $DIR1
	elif [[ ! -d $DIR1 ]]; then
		echo "$DIR1 already exists but is not a directory" 1>&2
	fi
	sudo mount $DISK1 $DIR1
	else echo "disk does not exist [sdb1]"
fi

if [[ -b  "$DISK2" ]]; then 
	echo "disk exists [sdc1]"
	if [[ ! -e $DIR2 ]]; then
		sudo mkdir -p $DIR2
	elif [[ ! -d $DIR2 ]]; then
		echo "$DIR2 already exists but is not a directory" 1>&2
	fi
	sudo mount $DISK2 $DIR2
	else echo "disk does not exist [sdc1]"
fi


# possible improvements :
# 1. pouvoir monter un second disk (sur usb2) [done]
# 2. faire des fonctions
# 3. écouter les événements udev et qui te propose de monter tes clés
# serait nice. 
# 4. si tu peux appeler le script avec un raccourci clavier pour
# de/monter des clés à la volée encore plus nice
# 5. si en plus tu gères les
# cartes sd et les téléphones en mtp nice+++
# 6. créer une fonction mount et umount qui prend un argument
