git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

LOGIN='\e[35m\u@\h\e[0m'
CWD='\e[32m\w\e[0m'
GIT='\e[33m$(git_branch)\e[0m'

PS1=$LOGIN' '$CWD' '$GIT' \n$ '

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
