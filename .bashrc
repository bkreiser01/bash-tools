git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

LOGIN='\e[35m\u@\h\e[0m'
CWD='\e[32m\w\e[0m'
GIT='\e[33m$(git_branch)\e[0m'

PS1=$LOGIN' '$CWD' '$GIT' \n$ '

# Grab aliases 
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Color manpages
man() {
    env \
    LESS_TERMCAP_mb="$(printf "\e[1;31m")" \
    LESS_TERMCAP_md="$(printf "\e[1;31m")" \
    LESS_TERMCAP_me="$(printf "\e[0m")" \
    LESS_TERMCAP_se="$(printf "\e[0m")" \
    LESS_TERMCAP_so="$(printf "\e[1;44;33m")" \
    LESS_TERMCAP_ue="$(printf "\e[0m")" \
    LESS_TERMCAP_us="$(printf "\e[1;32m")" \
    man "${@}"
}

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/private/git.key
