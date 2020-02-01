# Created by newuser for 5.7.1
	# neofetch
	feh --bg-fill /home/soimuen/Pictures/Desktop-Wallpaper/Wallpaper
	export EDITOR=nvim	
	#PROMPT=$'%m %n %/[%t] $'
	autoload -U compinit
	compinit
	bindkey -e

#OPTIONS
	setopt autocd 
	setopt autonamedirs
	setopt autopushd 
	setopt pushdignoredups
	setopt correct
	setopt cdablevars
	setopt histignoredups
	setopt histignorespace
	setopt globdots
	setopt nomatch
	setopt completeinword

# ALIASES
	#STANDALONE	
	alias czsh='cat /home/soimuen/.zshrc'
	alias nzsh='nvim /home/soimuen/.zshrc'
	alias szsh='source /home/soimuen/.zshrc'
	alias ps='ps -u'
	alias za="zathura"

	# GLOBAL
	alias mk='mkdir'
	alias tch='touch'
	alias pk='pkill'
	alias n='nvim'
	alias VS='code' # visual studio code
	alias mp='mocp'
	alias v='vim'
	alias tm='tmux'
	alias t='terminator'
	alias c='chromium&'
	alias f='firefox& '
	alias tp='htop'
	alias tl='tail'
	alias hd='head'
	alias thd='thunderbird&'
	alias gg='getent group'

	#LIST
	alias ls='ls --color=tty'
	alias lnc='l --color=none'
	alias l='ls -lh'
	alias la='ls -a'
	alias lg='ls --group-directories-first'
	alias lga='ls --group-directories-first --all'
	
	alias grep='grep --color=auto'

	alias rr='rm -r'
	
	#GIT
	alias gi='git init'
	alias gcl='git clone'
	alias ga='git add'
	alias gc='git commit -m'
	alias glo='git log'
	alias gls='git log --stat'
	alias gd='git diff'
	alias gs='git status'
	alias gsta='git stash'
	alias gpl='git pull'
	alias gpsh='git push'
	alias gchb='git checkout -b'
	alias gb='git branch'


	#TURNOFF
	alias off='shutdown -P +0'

	#UPDATING/UPGRADING
	alias pm='sudo pacman -Syu'

	#NETWORK
		#nmtui (this is the one you want)
		#nmcli dev wifi
		#nmcli dev wifi connect APname password
	
	
	#BATTERY
	alias bat='acpi -b' #acpi is a very useful tool to check on your battery, among other things
	# run acpi -V for more detailed info
	#alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
	
	#SOUND
	alias pavu='pavucontrol'

	#image viewer = sxiv
	#zathura = vi-based PDF viewer
	
	#IF MOUSE STOPS WORKING
	#sudo modprobe -r psmouse
	#sudo modprobe psmouse 
	
	#scan network
	#nmap +ip a+ nmap -sn 10.1.0.85/24
	#wireshark	
	#nslookup
	#wifite2

	#PROMPT PIMPING
	# # for have colors
	autoload -U colors
	colors

	host_color="yellow"
	path_color="blue"
	user_color="green"
	cmd_color="magenta"

	host="%{$fg[$user_color]%}%n%{$reset_color%}@%{$fg[$host_color]%}%m%{$reset_color%}"
	cpath="%B%{$fg[$path_color]%}%~%b"
	time="%{$fg[$time_color]%}%T%{$reset_color%}"
		end="%{$fg[$cmd_color]%}%%%{$reset_color%} "

PS1=" $cpath $end"
PS1=" $end"
RPS1="$host"
