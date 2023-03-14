#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Enable history appending instead of overwriting
shopt -s histappend

# Ignore duplicate commands in bash history
HISTCONTROL=ignoredups

# Bash History Size
HISTSIZE=2000
HISTFILESIZE=2000


