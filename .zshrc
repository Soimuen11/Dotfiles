#vi mode in term
set -o vi

# enable comments in interactive mode
setopt interactive_comments

#print quote when firing up a terminal
./.local/scripts/quote_generator/generator.sh

#load my personal scripts via symlinks
source $HOME/.config/zshenv/.aliasrc
source $HOME/.local/bin
# source /home/philwayne/.config/broot/launcher/bash/br

# load colors
autoload -U colors && colors

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

#no less history
LESSHISTSIZE=0

#key bindings
# bindkey -e #ctrl+a ctrl+e go to beg/end of line
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
PS1="%B%{$fg[yellow]%}{%{$fg[red]%}%n%{$fg[magenta]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[yellow]%}} ~>%{$reset_color%}%b "

export BROWSER="brave-bin"
export EDITOR=/usr/bin/nvim	
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/usr/lib/llvm/10/bin
# export PATH=/opt/texlive/2020/bin/x86_64-linux:/home/philwayne/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
