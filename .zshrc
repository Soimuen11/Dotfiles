# Created by newuser for 5.7.1

# neofetch
feh --bg-fill /home/soimuen/Pictures/Desktop-Wallpaper/Wallpaper

export EDITOR=/usr/bin/nvim	
autoload -U colors
colors
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
	
#PROMPT PIMPING
#PROMPT=$'%m %n %/[%t] $'
host_color="yellow"
path_color="blue"
user_color="green"
cmd_color="red"

host="%{$fg[$user_color]%}%n%{$reset_color%}@%{$fg[$host_color]%}%m%{$reset_color%}"
cpath="%B%{$fg[$path_color]%}%~%b"
time="%{$fg[$time_color]%}%T%{$reset_color%}"
		end="%{$fg[$cmd_color]%}%%%{$reset_color%} "

PS1=" $cpath $end"
PS1=" $end"
RPS1="$host"

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
source ~/.aliasrc

export PATH=/opt/texlive/2020/bin/x86_64-linux:/home/soimuen/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

source /home/soimuen/.config/broot/launcher/bash/br
