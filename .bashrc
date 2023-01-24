#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
complete -cf optirun
complete -cf primusrun
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias bd=". bd -s"
alias vim='nvim'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias DUNST_COMMAND_PAUSE='notify-send DUNST_COMMAND_PAUSE'
alias DUNST_COMMAND_RESUME='notify-send DUNST_COMMAND_RESUME'
alias nfs='optirun wine /home/shashwat/.wine/drive_c/Program\ Files\ \(x86\)/R.G.\ Mechanics/Need\ for\ Speed\ Most\ Wanted/NFS13.exe'
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
export EDITOR="vim"
export VISUAL="vim"
export JAVA_HOME=/usr/lib/jvm/default
export CATALINA_HOME=/opt/apache-tomcat-8.5.23
export ANDROID_HOME=/opt/android-sdk
if [[ $TERM == xterm ]]; then
    TERM=xterm-256color
fi
if [[ $TERM == screen ]]; then
    TERM=screen-256color
fi
export GPG_TTY=$(tty)
