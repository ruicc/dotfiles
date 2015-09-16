
FILES = .bash_profile .bashrc .gitconfig .ssh_auth_sock .tmux.conf .vimperatorrc .vimrc .zshrc .vim .vimperator .tmp

deploy:
	cp -fr $(FILES) ~

karabiner-export:
	/Applications/Karabiner.app/Contents/Library/bin/karabiner export > karabiner-import.sh
