
FILES = .bash_profile .bashrc .gitconfig .ssh_auth_sock .tmux.conf .vimrc .zshrc .ctags
DIRS = .vim .tmp

deploy:
	cp -a $(FILES) $(HOME)
	cp -a $(DIRS) $(HOME)
	mkdir -p $(HOME)/.oh-my-zsh/themes/
	cp -a ./steeef_custom.zsh-theme $(HOME)/.oh-my-zsh/themes/

drain:
	for file in $(FILES); do cp -a $(HOME)/$${file} .; done

karabiner-export:
	/Applications/Karabiner.app/Contents/Library/bin/karabiner export > karabiner-import.sh
