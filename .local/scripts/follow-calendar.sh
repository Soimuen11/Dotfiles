#!/bin/bash
# Prints appointments, events and todos
EVENTS=$(calcurse -G)
st -e 'echo "$EVENTS"'
notify-send "$EVENTS"
