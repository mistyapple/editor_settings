HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob notify
setopt HIST_IGNORE_ALL_DUPS
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
stty -ixon # disable Ctrl+S from pausing

export KEYTIMEOUT=50
export EDITOR=vim
export VISUAL="$EDITOR"
export P4EDITOR="$EDITOR"
export LANG=en_US.UTF-8

export TERMINFO=/usr/share/terminfo # to make backspace work in Python REPL


autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '%b '
zstyle ':vcs_info:*' enable git
# setopt prompt_subst
# $RPS1='${vcs_info_msg_0_}'

# change xfce4 terminal title to pwd
case $TERM in
    xterm*)
        precmd () {
          vcs_info
          psvar[1]=$vcs_info_msg_0_
          print -Pn "\e]0;%~\a"
        }
        ;;
esac

export PATH

# clone antidote if necessary
#if ! [[ -e ${ZDOTDIR:-~}/.antidote ]]; then
#  git clone https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
#fi
#source antidote and load plugins from `${ZDOTDIR:-~}/.zsh_plugins.txt`
#source ${ZDOTDIR:-~}/.antidote/antidote.zsh
#antidote load

autoload -U zmv

# case insensitive matching and partial matching
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+r:|[._-]=* r:|=*' '+l:|=* r:|=*'
zstyle ':completion:*' completer  _complete _approximate
zstyle ':completion:*' menu select
zmodload zsh/complist
autoload -Uz compinit && compinit

setopt correct
# setopt correct_all

# change directory colors in ls
#LS_COLORS=$LS_COLORS:'di=1;35:ow=01;33:tw=1;36:mi=01;37;41:pi=33:bd=01;33:cd=01;33:ex=01;32' && export LS_COLORS
# replace values in LS_COLORS instead of appending so tab completion uses the right colors
LS_COLORS=${LS_COLORS/di=[^:]#/di=01;35}
LS_COLORS=${LS_COLORS/tw=[^:]#/tw=01;36}
LS_COLORS=${LS_COLORS/mi=[^:]#/mi=01;30;41}
LS_COLORS=${LS_COLORS/pi=[^:]#/pi=33}
LS_COLORS=${LS_COLORS/bd=[^:]#/bd=01;33}
LS_COLORS=${LS_COLORS/cd=[^:]#/cd=01;33}
LS_COLORS=${LS_COLORS/or=[^:]#/or=31;40}
#LS_COLORS=${LS_COLORS/ln=[^:]#/ln=36}
#LS_COLORS=$LS_COLORS:'ow=01;33'
LS_COLORS=${LS_COLORS/ex=[^:]#/ex=01;32}
LS_COLORS=$LS_COLORS:'di=1;35:ow=01;33:tw=1;36:mi=01;30;41:pi=33:bd=01;33:cd=01;33:ex=01;32:or=01;97;41' && export LS_COLORS

zstyle ':completion:*' list-colors “${(s.:.)LS_COLORS}”

# change prompt based on vim mode
# PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '
function zle-line-init zle-keymap-select {
    case ${KEYMAP} in
        (vicmd)      PROMPT=$'%F{cyan}❮%f ' ;;
        (main|viins) PROMPT=$'%F{yellow}❯%f ' ;;
        (*)          PROMPT=$'%F{cyan}❮%f ' ;;
    esac
    local NEWLINE=$'\n'
    local TABSTOP=$'\t'
    PROMPT="%B%F{blue}%4~%f     %F{208}%1v%f%b$NEWLINE$PROMPT"
    #PROMPT="%F{blue}%~%f$NEWLINE$PROMPT"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

source ~/.zsh_bindkeys
source ~/.zsh_aliases
source ~/.zsh_functions

# manually install plugins to avoid permissions denied from plugin managers
#fpath+=($HOME/.zsh/pure)
#autoload -Uz promptinit && promptinit && prompt pure
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath+=($HOME/.zsh/zsh-completions)
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# up and down arrows
#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down
bindkey '^a' history-substring-search-up
bindkey '^s' history-substring-search-down
