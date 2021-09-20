alias dc="docker-compose"
alias gts="git status"
alias gds="git diff --staged"
alias grpo="git remote prune origin"

# zsh skip words
# option + L/R arrow
# end of line ctrl+E
# beginning of line ctrl+A
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# https://github.com/nvbn/thefuck
eval $(thefuck --alias)
