if [[ -e /opt/homebrew/bin/brew ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi
PS1='%~ %(?.%F{green}.%F{red})%#%f '
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
