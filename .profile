# add sublime text to path too
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=emacs

# basic aliases
alias ls="ls -a"
cd() { builtin cd "$@"; ls; }
alias cd..="cd ../"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias grep='grep --color=auto'
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias tb='tensorboard --logdir '

# Functions
run_python_tests() {
    # function to run all python unittests
    ARG1=${1:-./}
    python -m unittest discover $ARG1 -v
}
alias tests=run_python_tests

extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

