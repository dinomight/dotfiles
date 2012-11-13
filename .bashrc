# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export EDITOR=vim
export VISUAL=$EDITOR
export SVN_EDITOR=$EDITOR
export PAGER=more
export HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:[ \t]*"
alias hist='history | grep $1' #requires argument

# Bash settings
ulimit -S -c 0          # no core dumps
set -o noclobber        # prevents catting over files

shopt -s cdspell
shopt -s checkhash
shopt -s checkwinsize
shopt -s cmdhist
shopt -s no_empty_cmd_completion

# alias commands

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ls based aliases

alias la='ls -A'                # show hidden files
alias ls='ls --color=always'    # add colors and file extensions
alias lx='ls -lXB'              # sort by extension
alias lk='ls -lSr'              # sort by size
alias lc='ls -lcr'              # sort by change time
alias lu='ls -lur'              # sort by access time
alias lr='ls -lR'               # recursive ls
alias lt='ls -ltr'              # sort by date
alias lm='ls -al | ${PAGER}'    # pipe through pager
alias ll='ls -l'                # long listing

# chmod aliases
alias mx='chmod a+x'
alias 000='chmod 000'
alias 644='chmod 644'
alias 755='chmod 755'

alias home='cd ~'
alias ping='ping -c 10'
alias ebrc='${EDITOR} ~/.bashrc;sbrc'
alias evrc='${EDITOR} ~/.vimrc'
alias sbrc='source ~/.bashrc'
alias ..='cd ..'
alias sr='screen -d -RR'
alias sx='screen -x'
alias cl='clear'
alias rmd='rm -fdr '
alias cls='clear'

BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
WHITE='\e[1;37m'
NC='\e[0m'              # No Color

elite()
{
    local GRAY="\[\033[1;30m\]"
    local LIGHT_GRAY="\[\033[0;37m\]"
    local CYAN="\[\033[0;36m\]"
    local LIGHT_CYAN="\[\033[1;36m\]"
    local NO_COLOUR="\[\033[0m\]"

    case $TERM in
    xterm*|rxvt*)
        local TITLEBAR='\[\033]0;\u@\h:\w\007\]'
        ;;
    *)
        local TITLEBAR=""
        ;;
    esac

    local temp=$(tty)
    local GRAD1=${temp:5}
    PS1="$TITLEBAR$GRAY-$CYAN-$LIGHT_CYAN($CYAN\u$GRAY@$CYAN\h$LIGHT_CYAN)$CYAN-$LIGHT_CYAN($CYAN\#$GRAY/$CYAN$GRAD1$LIGHT_CYAN)$CYAN-$LIGHT_CYAN($CYAN\$(date +%H%M)$GRAY/$CYAN\$(date +%d-%b-%y)$LIGHT_CYAN)$CYAN-$GRAY-$LIGHT_GRAY\n$GRAY-$CYAN-$LIGHT_CYAN($CYAN\$$GRAY:$CYAN\w$LIGHT_CYAN)$CYAN-$GRAY-$LIGHT_GRAY "
    PS2="$LIGHT_CYAN-$CYAN-$GRAY-$NO_COLOUR "
}

elite

complete -A hostname rsh rcp telnet rlogin r ftp ping disk ssh
complete -A export   printenv
complete -A variable export local readonly unset
complete -A enabled  builtin
complete -A alias    alias unalias
complete -A function function
complete -A user     su mail finger write

complete -A helptopic      help
complete -A shopt          shopt
complete -A stopped -P '%' bg
complete -A job -P '%'     fg jobs disown

complete -A directory            mkdir rmdir
complete -A directory -o default cd

# Compression
complete -f -o default -X '*.+(zip|ZIP)'  zip
complete -f -o default -X '!*.+(zip|ZIP)' unzip
complete -f -o default -X '*.+(z|Z)'      compress
complete -f -o default -X '!*.+(z|Z)'     uncompress

if [ -f "$HOME/.proxy_settings" ]; then
    source "$HOME/.proxy_settings"
fi

if [ -f "$HOME/.bashrc_custom" ]; then
    source "$HOME/.bashrc_custom"
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
