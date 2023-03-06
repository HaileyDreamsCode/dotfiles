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

if [ ! -f ~/src/github.com/burke/minidev/dev.sh ]; then
    mkdir -p ~/src/github.com/burke
    git clone https://github.com/burke/minidev src/github.com/burke/minidev
fi

source ~/src/github.com/burke/minidev/dev.sh
alias dcd="dev cd"

if [ ! -f /usr/local/share/chruby/chruby.sh ]; then
  dev clone postmodern/chruby
  echo "Installing chruby. You may need to enter your sudo password."
  sudo make install
fi

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

if [ ! -f /usr/local/bin/ruby-install ]; then
 dev clone postmodern/ruby-install
 echo "Installing ruby-install. You may need to enter your sudo password."
 sudo make install
fi

if [[ -e $HOME/src/chromium.googlesource.com/chromium/tools/depot_tools ]]; then
  export PATH="$PATH:$HOME/src/chromium.googlesource.com/chromium/tools/depot_tools"
fi
