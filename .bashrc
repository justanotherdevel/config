#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
complete -cf optirun
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias bd=". bd -s"
alias diff='diff --color=auto'
alias grep='grep --color=auto'
man() {
   LESS_TERMCAP_md=$'\e[01;31m' \
   LESS_TERMCAP_me=$'\e[0m' \
   LESS_TERMCAP_se=$'\e[0m' \
   LESS_TERMCAP_so=$'\e[01;44;33m' \
   LESS_TERMCAP_ue=$'\e[0m' \
   LESS_TERMCAP_us=$'\e[01;32m' \
   command man "$@"
}
set -o vi
