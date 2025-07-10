# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export LC_ALL=ja_JP.utf8
export LANGUAGE=ja_JP.utf8
export EDITOR=vim

PATH=$HOME/.local/bin:$PATH
export PATH

export LD_LIBRARY_PATH=$HOME/.local/lib

source $HOME/.ssh_auth_sock

exec zsh
if [ -e /Users/ruicc/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/ruicc/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
source "$HOME/.cargo/env"
