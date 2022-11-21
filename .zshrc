export ZSH="/home/ali/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# alias tmux="tmux -2"
alias vim="nvim"
alias tmux="TERM=screen-256color-bce tmux"
export PATH=$PATH:/home/ali/.local/bin
