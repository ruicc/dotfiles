
FILES = .bash_profile .bashrc .gitconfig .ssh_auth_sock .tmux.conf .vimperatorrc .vimrc .zshrc .vim .vimperator .tmp

deploy:
	cp -a $(FILES) $(HOME)
	cp -a ./steeef_custom.zsh-theme $(HOME)/.oh-my-zsh/themes/

karabiner-export:
	/Applications/Karabiner.app/Contents/Library/bin/karabiner export > karabiner-import.sh
