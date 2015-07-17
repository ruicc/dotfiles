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

export LD_LIBRARY_PATH=$HOME/usr/lib

source $HOME/.ssh_auth_sock

exec zsh
