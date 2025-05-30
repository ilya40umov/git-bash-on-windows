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

    local venv=""
    if [ ! -z "$VIRTUAL_ENV_PROMPT" ]; then
        venv="${VIRTUAL_ENV_PROMPT%% }"
    elif [ ! -z "$VIRTUAL_ENV" ]; then
        venv="$(basename ${VIRTUAL_ENV})"
    else
        venv=""
    fi

    local path_bit="\[\e[33m\]\w\[\e[0m\] "

    local branch_bit=""
    if [ ! -z "$branch" ]; then
        local branch_symbol=$'\u2387 '
        branch_bit="\[\033[36m\]${branch_symbol}${branch}\[\033[0m\] "
    fi

    local venv_bit=""
    if [ ! -z "$venv" ]; then
      venv_bit="\[\033[31m\]$venv\[\033[0m\] "
    fi
   
    #export PS1="\[\e]0;\W\a\]\n\[\e[32m\]\u@\H \[\e[33m\]\w\[\e[0m\] \[\033[36m\]$branch\[\033[0m\] \[\033[31m\]$venv\[\033[0m\] \n\$ "
    export PS1="${path_bit}${branch_bit}${venv_bit}\$ "
}
export PROMPT_COMMAND=__git_ps1

# define editor
export VISUAL=vim
export EDITOR="$VISUAL"

# define pager
export LESS='-R'
export PAGER='less'
export LESSHISTFILE=-

# load bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# load bash completion
if [ -f ~/.bash_completion ]; then
    . ~/.bash_completion
fi
