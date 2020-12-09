#!/bin/bash
# This script aims at tidying up my Downloads directory
# Set up a cron job to run it once a week
# All .jpg & .jpeg & .png should go into TBS-Pictures 
# All .pdf into PDFs
# All .mkv .avi .mp4 into TBS-Movies

current_dir=$(pwd)
if [[ $current_dir != /home/$USER/Downloads ]];
	then cd /home/$USER/Downloads
	else #do nothing
		:
fi

# checking if the directories exist
declare -a dirs_to_check=("PDFs" "TBS-Movies" "TBS-Music" "TBS-Pictures")
for dir in "${dirs_to_check[@]}"
do
	if [[ ! -d $dir ]];
		then echo "dir does not exist"
		echo "creating directory $dir"
		mkdir -p ~/Downloads/$dir
		else echo "dir does exist"
	fi
done

mv *.pdf /home/$USER/Downloads/PDFs/
mv *.png *.jpg *.jpeg /home/$USER/Downloads/TBS-Pictures/
mv *.mkv *.avi *.mp4 /home/$USER/Downloads/TBS-Movies/
mv *.iso ISOs
