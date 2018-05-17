#!/usr/bin/bash

# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brew-cask(homebrew本体に入ったようだ)
#brew install caskroom/cask/brew-cask

# Keyconfig/OS environment
#brew cask install karabiner
#brew cask install seil
#brew cask install showyedge

# Daily use
brew cask install firefox
brew cask install google-chrome
brew cask install dropbox

# Terminal/Editor
brew cask install iterm2
brew cask install macvim

# CUI tools
brew install vim
brew install tmux
brew install zsh
brew install coreutils
brew install findutils
brew install binutils
brew install wget

# Development tools
#brew cask install virtualbox
#brew cask install vagrant
#brew install docker
#brew install boot2docker

# Oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp .zshrc ~/.zshrc

# Haskell (TODO: Use stack)
#brew install ghc
#brew install cabal-install
