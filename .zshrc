# Created by newuser for 5.7.1
	
	PROMPT=$'%m %n %/[%t]$'
	autoload -U compinit
	compinit

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
	alias czsh='cat .zshrc'
	alias nzsh='nvim .zshrc'
	alias szsh='source .zshrc'
	alias ps='ps -u'

	# GLOBAL
	alias pk='pkill'
	alias n='nvim'
	alias VS='code' # visual studio code
	alias mp='mocp'
	alias v='vim'
	alias tm='tmux'
	alias t='terminator'
	alias c='chromium &'
	alias f='firefox&'
	alias thd='thunderbird&'
	alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
	alias gg='getent group'

	#LIST
	alias ls='ls --color=tty'
	alias l='ls -lh'
	alias la='ls -a'
	alias lg='ls --group-directories-first'
	alias lga='ls --group-directories-first --all'
	
	alias grep='grep --color=auto'
	
	#GIT
	alias gi='git init'
	alias gcl='git clone'
	alias ga='git add'
	alias gc='git commit -m'
	alias glo='git log'
	alias gd='git diff'
	alias gs='git status'
	alias gpl='git pull'
	alias gpsh='git push'
	alias gchb='git checkout -b'
	alias gb='git branch'


	#TURNOFF
	alias off='shutdown -P +0'

	#UPDATING/UPGRADING
	alias pm='sudo pacman -Syu'

