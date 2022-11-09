HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob notify
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode

export KEYTIMEOUT=10
export EDITOR=vim
export VISUAL="$EDITOR"

# clone antidote if necessary
if ! [[ -e ${ZDOTDIR:-~}/.antidote ]]; then
  git clone https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
fi
# source antidote and load plugins from `${ZDOTDIR:-~}/.zsh_plugins.txt`
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

autoload -U zmv

# case insensitive matching and partial matching
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+r:|[._-]=* r:|=*' '+l:|=* r:|=*'
zstyle ':completion:*' completer  _complete _approximate
zstyle ':completion:*' menu select
zmodload zsh/complist
autoload -Uz compinit && compinit

setopt correct
setopt correct_all

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# plugin bindkeys
bindkey '^j' autosuggest-execute
bindkey '^k' autosuggest-accept
bindkey '^o' forward-word

## Some useful aliases
alias ll='ls -la'
alias la='ls -a'
alias cp='cp -i'
alias mv='mv -i'

# ls after cd
chpwd() ls

# change directory colors in ls
LS_COLORS=$LS_COLORS:'di=1;35:ow=01;33:tw=1;36:mi=01;37;41:pi=33:bd=01;33:cd=01;33' && export LS_COLORS

mkcd () { mkdir -p -- "$1" && cd -P -- "$1" }
g () { gvim -p "$@" }

# List files in zsh with <TAB>
#
# Copyleft 2017 by Ignacio Nunez Hernanz <nacho _a_t_ ownyourbits _d_o_t_ com>
# GPL licensed (see end of file) * Use at your own risk!
#
# Usage:
#   In the middle of the command line:
#     (command being typed)<TAB>(resume typing)
#
#   At the beginning of the command line:
#     <SPACE><TAB>
#     <SPACE><SPACE><TAB>
#
# Notes:
#   This does not affect other completions
#   If you want 'cd ' or './' to be prepended, write in your .zshrc 'export TAB_LIST_FILES_PREFIX'
#   I recommend to complement this with push-line-or edit (bindkey '^q' push-line-or-edit)
function tab_list_files
{
  if [[ $#BUFFER == 0 ]]; then  
    BUFFER="cd "
    CURSOR=3
    zle list-choices
  elif [[ $BUFFER =~ ^[[:space:]][[:space:]].*$ ]]; then
    BUFFER="./"
    CURSOR=2
    zle list-choices
    [ -z ${TAB_LIST_FILES_PREFIX+x} ] && BUFFER="  " CURSOR=2
  elif [[ $BUFFER =~ ^[[:space:]]*$ ]]; then
    BUFFER="ls "
    CURSOR=3
    zle list-choices
    zle backward-kill-word
    [ -z ${TAB_LIST_FILES_PREFIX+x} ] && BUFFER=" " CURSOR=1
  else
    BUFFER_=$BUFFER
    CURSOR_=$CURSOR
    zle expand-or-complete || zle expand-or-complete || {
      BUFFER="ls "
      CURSOR=3
      zle list-choices
      BUFFER=$BUFFER_
      CURSOR=$CURSOR_
    }
  fi
}
zle -N tab_list_files
bindkey '^I' tab_list_files

# uncomment the following line to prefix 'cd ' and './' 
# when listing dirs and executables respectively
export TAB_LIST_FILES_PREFIX

# uncomment the following line to complement tab_list_files with ^q
bindkey '^q' push-line-or-edit

# change prompt based on vim mode
function zle-line-init zle-keymap-select {
    case ${KEYMAP} in
        (vicmd)      PROMPT=$'%F{cyan}❮%f ' ;;
        (main|viins) PROMPT=$'%F{yellow}❯%f ' ;;
        (*)          PROMPT=$'%F{cyan}❮%f ' ;;
    esac
    local NEWLINE=$'\n'
    #PROMPT="%F{blue}%~%f$NEWLINE$PROMPT"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%~\a"}
        ;;
esac

# manually install plugins to avoid permissions denied from plugin managers
#fpath+=($HOME/.zsh/pure)
#autoload -Uz promptinit && promptinit && prompt pure
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#fpath+=($HOME/.zsh/zsh-completions)
#source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# up and down arrows
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


