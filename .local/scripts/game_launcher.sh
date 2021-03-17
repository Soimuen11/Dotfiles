#!/bin/bash

# ask me if I want to play: psp / gamecube / gba / nds
LIBRARY=$(ls "/home/$USER/Games" | dmenu -p "Emulator:")

# show me the appropriate library of games after above choice
GAME=$(ls "/home/$USER/Games/$LIBRARY" | dmenu -p "Game To Launch:")
GAME_PATH="/home/$USER/Games/$LIBRARY"

case $LIBRARY in
	psp) PPSSPPQt "$GAME_PATH/$GAME";;
	GameCube) dolphin-emu "$GAME_PATH/$GAME";;
	gba) visualboyadvance-m "$GAME_PATH/$GAME";;
	nds) desmume "$GAME_PATH/$GAME";;
esac
	
