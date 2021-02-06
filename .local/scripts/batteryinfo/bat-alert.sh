#!/bin/bash
# Add it as a cron job: 
#*/1 * * * * export DISPLAY=:0.0 && bash /home/philwayne/Dotfiles/.local/scripts/batteryinfo/bat-alert.sh

ac_adapter=$(acpi -a | cut -d' ' -f3 | cut -d- -f1)

for battery in /sys/class/power_supply/BAT?
do
	capacity=$(cat $battery/capacity)
done

echo $capacity 
if [[ "$ac_adapter" = "off" ]] && [[ $capacity -lt 15 ]]; 
then
		# aplay r2d2-alarm.wav
		notify-send 'Warning: Low Battery Power!' 
		# espeak 'Warning: Low Battery Power!'
else
	:
fi


