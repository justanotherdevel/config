# The following lines were added by compinstall
cd $HOME
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/shashwat/.zshrc'

autoload -Uz compinit
compinit

autoload -Uz promptinit
promptinit

source /usr/share/doc/pkgfile/command-not-found.zsh
ttyctl -f
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
unsetopt beep
bindkey -v
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

#Additional settings

setopt completeinword
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# End of lines configured by zsh-newuser-install
# Adding settings from bashrc
alias bd=". bd -s"
#complete -cf optirun
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias DUNST_COMMAND_PAUSE='notify-send DUNST_COMMAND_PAUSE'
alias DUNST_COMMAND_RESUME='notify-send DUNST_COMMAND_RESUME'
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
if [[ -x "`whence -p dircolors`" ]]; then
  eval `dircolors`
  alias ls='ls -F --color=auto'
else
  alias ls='ls -F'
fi

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME


## Remove duplicate entries
setopt PUSHD_IGNORE_DUPS

## This reverts the +/- operators.
setopt PUSHD_MINUS
