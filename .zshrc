# Created by newuser for 5.7.1

# neofetch
# feh --bg-fill /home/soimuen/Pictures/Desktop-Wallpaper/Wallpaper

autoload -U colors && colors
#
# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

#key bindings
bindkey -e #ctrl+a ctrl+e go to beg/end of line
# bindkey -v "^[[3~" backward-delete-char

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.config/zshenv/history

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
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
source $HOME/.config/zshenv/.aliasrc
#load my personal scripts via symlinks
source $HOME/.local/bin
source /home/soimuen/.config/broot/launcher/bash/br

export EDITOR=/usr/bin/nvim	
export PATH=/opt/texlive/2020/bin/x86_64-linux:/home/soimuen/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
