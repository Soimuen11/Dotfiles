#!/bin/bash
sudo modprobe -r psmouse
sudo modprobe psmouse

# doesn't work on Gentoo
# works perfectly on Arch Linux
