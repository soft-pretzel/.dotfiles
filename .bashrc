# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
PS1='[\u@\h \W]\$ '

# Environment variables
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=kitty
