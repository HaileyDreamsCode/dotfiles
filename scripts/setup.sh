#!/bin/bash -ex

if [[ ! -d $HOME/.emacs.d/.git ]]; then
	git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi
git config --global user.email "me@hailey.rocks"
git config --global user.name "Hailey"
if [[ $(uname) == "Darwin" ]]; then
	puts "Installing brew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo "Installing Apple developer tools"
	xcode-select --install
	echo "Installing Emacs Plus"
	brew tap d12frosted/emacs-plus
	brew install emacs-plus
	echo "Installing Vim"
	brew install vim
elif (type apt-get > /dev/null); then
	echo "Installing build-essential"
	sudo apt-get install -y build-essential
	sudo apt-get install -y vim
elif (type pacman > /dev/null); then
	echo "Installing base-devel"
	sudo pacman -Sy --noconfirm base-devel
	echo "Installing vim"
	sudo pacman -Sy --noconfirm vim
	echo "Installing Emacs"
	sudo pacman -Sy --noconfirm emacs
else
	echo "Unsupported platform"
	exit 1
fi
