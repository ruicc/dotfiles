# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

#PS1="[\t][\u@dev_gundam.jp(\h):\w]\$ "
PS1="\[\033[1;34m\][\$(date +%H:%M)][\u@\h:\w]\[\033[0m\]\[\033[1;31m\]\$(cur_branch)\[\033[0m\]\$(show_prompts) "

alias vi="vim"
alias rm="rm -i"
alias ls="ls -F --color"
alias la="ls -Fa --color"
alias ll="ls -Fl --color"
alias lla="ls -Fla --color"

alias gitPull="git pull"
alias gitSt="git status"
alias gitst="git status"
alias gitDi="git diff"
alias gitdi="git diff"
alias ta="tmux attach"

function show_prompts {
	local result=''
	for i in $(seq 0 $(ps | grep vim | wc -l))
	do
		 result=$result'$';
	done
	echo $result;
}

function cur_branch {
	test -d "${PWD}/.git"
	if [ $? == 1 ]; then
		return
	fi

	br=$(echo $(git symbolic-ref HEAD) | cut -d '/' -f 3-)
	echo "(${br})"
}

# for tmux
export __CF_USER_TEXT_ENCODING=0x1FA:0x08000100:0
export TMUX=tmux
source "$HOME/.cargo/env"

eval "$(direnv hook bash)"
