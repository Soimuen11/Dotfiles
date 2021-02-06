#!/bin/bash
# To be combined with a CRON job which sends me an notif/email every day to tell me
# the events and appointments I have for the day?

# Prints appointments, events and todos
DISPLAY=0.0
events=$(calcurse -G)
echo $events
# notify-send $events -> throws back error 'invalid number of options'
