#!/bin/bash
for battery in /sys/class/power_supply/BAT?
do
	capacity=$(cat $battery/capacity)
	# echo $capacity #displays info of 2 batteries
done
#display info of battery in use
echo $capacity 
if [[ $capacity -lt 20 ]];
then
	echo "WARNING : LOW BATTERY POWER"
fi
