#!/bin/bash
for battery in /sys/class/power_supply/BAT?
do
	capacity=$(cat $battery/capacity)
done

echo $capacity 
if [[ $capacity -lt 15 ]];
then
	# aplay r2d2-alarm.wav
	notify-send 'Warning: Low Battery Power!' && espeak 'Warning: Low Battery Power!'
fi


