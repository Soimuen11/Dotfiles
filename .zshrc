# Created by newuser for 5.7.1

#OPTIONS
	setopt autocd 
	setopt autopushd 
	setopt pushdignoredups
	setopt correct
	setopt cdablevars
	setopt histignoredups
	setopt histignorespace
	setopt globdots

# ALIASES
	#STANDALONE	
	alias czsh='cat .zshrc'

	# GLOBAL
	alias pk='pkill'
	alias n='nvim'
	alias nzsh='nvim .zshrc'
	alias szsh='source .zshrc'
	alias mp='mocp'
	alias v='vim'
	alias tm='tmux'
	alias t='terminator'
	alias c='chromium-browser &'
	alias f='firefox&'
	alias thd='thunderbird&'
	alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'

	#LIST
	alias ls='ls --color=auto'
	alias l='ls -l'
	alias la='ls -a'
	alias lg='ls --group-directories-first'
	alias lga='ls --group-directories-first --all'
	
	#GIT
	alias g='git init'
	alias gcl='git clone'
	alias ga='git add'
	alias gc='git commit -m'
	alias grep='grep --color=auto'
	alias gpl='git pull'
	alias gpsh='git push'

	#TURNOFF
	alias off='shutdown -P'
