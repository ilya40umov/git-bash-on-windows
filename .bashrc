# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# setting history length
HISTSIZE=10000
HISTFILESIZE=100000

# faster version of PS1
function __git_ps1 () {
    branch=""
 
    local headfile head branch
    local dir="$PWD"
 
    while [ -n "$dir" ]; do
        if [ -e "$dir/.git/HEAD" ]; then
            headfile="$dir/.git/HEAD"
            break
        fi
        dir="${dir%/*}"
    done
 
    if [ -e "$headfile" ]; then
        read -r head < "$headfile" || return
        case "$head" in
            ref:*) branch="${head##*/}" ;;
            "") branch="" ;;
            *) branch="${head:0:7}" ;;
        esac
    fi
 
    if [ ! -z "$branch" ]; then
        branch="($branch)"
    fi
 
    export PS1="\[\e]0;\W\a\]\n\[\e[32m\]\u@\H \[\e[33m\]\w\[\e[0m\] \[\033[36m\]$branch\[\033[0m\]\n\$ "
}
export PROMPT_COMMAND=__git_ps1

# load bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# make sure vim used as editor
export VISUAL=vim
export EDITOR="$VISUAL"
