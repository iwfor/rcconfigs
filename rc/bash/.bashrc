PS1='\[\e[0;33m\]\u\[\e[0;31m\]@\[\e[0;32m\]\h\[\e[0;31m\]:\[\e[0;36m\]\w\[\e[0;31m\])\[\e[0m\] '

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cd..="cd .."
alias cls="clear"

# ls command
if [[ $OSNAME = "FreeBSD" || $OSNAME = "Darwin" ]]; then
    LSCOLOROPT='-G'
elif [[ $OSNAME = "Linux" || $OSNAME = "cygwin" || $OSNAME = "CYGWIN_NT-5.1" ]]; then
    LSCOLOROPT='--color=auto'
fi
alias dir="ls -AlF -G"
alias l="ls -AsF -G"

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
