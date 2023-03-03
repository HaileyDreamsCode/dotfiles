RED='\033[0;31m'
NC='\033[0m'
if [[ -e /opt/homebrew/bin/brew ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

PS1='%~ %(?.%F{green}.%F{red})%#%f '
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# If there are changes to the config files that aren't committed, warn on it.
if [[ `config status --porcelain` ]]; then
    echo "${RED}uncommitted changes to config present${NC}"
fi
