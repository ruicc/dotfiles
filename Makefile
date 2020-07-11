
FILES = .bash_profile .bashrc .gitconfig .ssh_auth_sock .tmux.conf .vimperatorrc .vimrc .zshrc
DIRS = .vim .tmp .vimperator

deploy:
	cp -a $(FILES) $(HOME)
	cp -a $(DIRS) $(HOME)
	cp -a ./steeef_custom.zsh-theme $(HOME)/.oh-my-zsh/themes/

drain:
	for file in $(FILES); do cp -a $(HOME)/$${file} .; done

karabiner-export:
	/Applications/Karabiner.app/Contents/Library/bin/karabiner export > karabiner-import.sh
