#!/bin/bash
#This script aims at tidying up my Downloads directory

dir=$(pwd)
if [[ $dir != /home/soimuen/Downloads ]];
	then cd /home/soimuen/Downloads
	else #do nothing
		:
fi

#checking if the directories exist
declare -a dirs_to_check=("PDFs" "TBS-Movies" "TBS-Music" "TBS-Pictures")
for dir in "${dirs_to_check[@]}"
do
	echo $dir
	if [[ ! -d $dir ]];
		then echo "dir does not exist"
		echo "creating directory $dir"
		mkdir -p ~/Downloads/$dir
		else echo "dir does exist"
	fi
done

 #types of files to be checked
 #pdf, png, jpg, jpeg, mp4, mkv, avi
 cp -v *.pdf ~/Downloads/PDFs/
 cp -v *.png *.jpg *.jpeg ~/Downloads/TBS-Pictures/
 cp -v *.mkv *.avi ~/Downloads/TBS-Movies/
