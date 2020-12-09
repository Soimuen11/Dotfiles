#!/bin/bash

#Warning: Avant d'utiliser ce script pour la première fois, verifier que tout est a jour dans mes Dotfiles dans mon home et mon Dotfiles dir

# This bash script is yet to be written
# It should:
	# git add & commit the update
	# notify me that there has been some change so that I can push the latest
		# commits to github with a CRON JOB every week


# 1. Remove all the dotfiles in the Dotfiles/ directory
# rm -rv .*

# 2. Make a copy of all the dotfiles currently in use to Dotfiles/
# cp -rv /home/$USER/.ssh
# cp -rv /home/$USER/.bash*
# cp -rv /home/$USER/.zshrc
# cp -rv /home/$USER/.xprofile
# cp -rv /home/$USER/.vim
# cp -rv /home/$USER/.vimrc
# cp -rv /home/$USER/.tmux.conf
# cp -rv /home/$USER/.local
# cp -rv /home/$USER/.newsboat
# cp -rv /home/$USER/.Authority


# 3. git add and git commit
# git add -u
# git add *
# git commit -m "Automatic update"

# 4. Notify me there has been some change
# notify-send 'your dotfiles have been successfully updated'
