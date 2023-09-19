# The following lines were added by compinstall
#prompt off
# cd $HOME
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/shashwat/.zshrc'

autoload -Uz compinit
compinit

#autoload -Uz promptinit
#promptinit



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
alias vim='nvim'
#complete -cf optirun
#complete -cf primusrun
alias lammps='lmp'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias DUNST_COMMAND_PAUSE='notify-send DUNST_COMMAND_PAUSE'
alias DUNST_COMMAND_RESUME='notify-send DUNST_COMMAND_RESUME'
export EDITOR="nvim"
export VISUAL="nvim"
export JAVA_HOME=/usr/lib/jvm/default
export CATALINA_HOME=/opt/apache-tomcat-8.5.23
export ANDROID_HOME=/home/shashwat/Android/Sdk/
export QT_QPA_PLATFORMTHEME="qt5ct"
export CHROME_EXECUTABLE=google-chrome-stable
export PATH="$PATH":"$HOME/.pub-cache/bin"
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

# Editor for long command
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Ruby
eval "$(rbenv init -)"
path+=("/home/shashwat/.gem/ruby/2.6.0/bin")

#android studio
path+=("/home/shashwat/Android/Sdk/cmdline-tools/latest/bin/")
path+=("/home/shashwat/Android/Sdk/emulator/")
path+=("/home/shashwat/Android/Sdk/platform-tools/")
export ANDROID_SDK_ROOT="/home/shashwat/Android/Sdk/"


# Lammps
path+=("/home/shashwat/Documents/CIC/electronics/GasBarrierNanofoam/lammps/lammps-7Aug19/build")

# AppImage
path+=("/home/shashwat/AppImage/")

path+=("/home/shashwat/.local/bin")

# Snaps
path+=('/var/lib/snapd/snap/bin')

# Cursor Mode

cursor_mode() {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

cursor_mode

# Vim keybinding for completion
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Plugins

# autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 
bindkey '^ ' autosuggest-accept
#fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Temporary fix for android emulator (hopefully)
# function emulator { ( cd "$(dirname "$(whence -p emulator)")" && ./emulator "$@"; ) }
# cd "$AUTOCD"


ranger_cd() {
    temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
    ranger --choosedir="$temp_file" -- "${@:-$PWD}"
    if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
        cd -- "$chosen_dir"
    fi
    rm -f -- "$temp_file"
}

alias ranger=ranger_cd
source /usr/share/nvm/init-nvm.sh
alias python3=python

eval "$(starship init zsh)"


# Load Angular CLI autocompletion.
source <(ng completion script)
export QT_STYLE_OVERRIDE=kvantum

# cd $HOME
