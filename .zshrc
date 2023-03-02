eval "$(/opt/homebrew/bin/brew shellenv)"
PS1='%~ %(?.%F{green}.%F{red})%#%f '
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
