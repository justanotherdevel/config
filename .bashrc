#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias tmux='tmux -2'
PS1='[\u@\h \W]\$ '
#complete -cf sudo
#complete -cf man
alias bd=". bd -s"
if [[ $TERM == xterm ]]; then
	TERM=xterm-256color
fi
if [[ $TERM == screen ]]; then
	TERM=screen-256color
fi
