# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef_custom"
#ZSH_THEME="steeef"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

#export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
#export PATH="/usr/local/opt/coreutils/libexec/gnubin:$HOME/.local/bin:$PATH"
#export PATH="$HOME/.node_modules_global/bin:$PATH"
#export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
#export PATH="$HOME/Library/Python/3.7/bin:$PATH"
#export MANPATH="/usr/local/man:$MANPATH"
#export LD_LIBRARY_PATH=$HOME/.local/lib
#export PATH="/usr/local/opt/python@3.7/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LC_ALL=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LANGUAGE=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
source $HOME/.ssh_auth_sock

# java(OSX)
if [ $(uname) = "Darwin" ]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
fi

export ANDROID_HOME="$HOME/Library/Android/sdk"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#alias adb="$ANDROID_HOME/platform-tools/adb"
#alias fiveserver="$HOME/Works/five/repo/Five"
#alias fiveview="$HOME/Works/five/repo/Five.view"
#alias fivesdk="$HOME/Works/five/repo/FiveSDK"
#alias fivelog="$HOME/Works/five/log"
#alias f1="$HOME/Works/five/repo/Five"
#alias f2="$HOME/Works/five/repo/Five.2"
#alias f3="$HOME/Works/five/repo/Five.3"
#alias fv="$HOME/Works/five/repo/Five.view"
#alias fm="$HOME/Works/five/repo/Five.master"
#alias fe="$HOME/Works/five/repo/FiveExperimental"
#alias fl="$HOME/Works/five/five-note"
alias gr="git grep"
alias s="git status"
alias ls="ls --color=auto -GF"

if [ -f "$HOME/.fzfrc" ]; then
    source "$HOME/.fzfrc"
fi

# check if `docker-machine` command exists
#if command -v docker-machine > /dev/null; then
#  # fetch the first running machine name
#  local machine=$(docker-machine ls | grep Running | head -n 1 | awk '{ print $1 }')
#  if [ "$machine" != "" ]; then
#    eval "$(docker-machine env $machine)"
#    export DOCKER_IP=$(docker-machine ip $machine)
#  fi
#fi

# nix
#. /Users/ruicc/.nix-profile/etc/profile.d/nix.sh
#. /nix/var/nix/profiles/default/etc/profile.d/nix.sh
# workaround
#export NIX_PATH=${NIX_PATH:+$NIX_PATH:}$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels
# nixコマンドが消え去ると困るからとりあえず入れておく..
#export PATH="$PATH:/nix/var/nix/profiles/default/bin"

# codex: Make sure "codex" already exists
eval "$(codex configure zsh)"
export FPATH="~/.nix-profile/share/zsh/site-functions/:$FPATH"

# local settings
if [ -f "$HOME/.localrc" ]; then
  source "$HOME/.localrc"
fi

# direnv
eval "$(direnv hook zsh)"

# nvm
#export NVM_DIR="$HOME/.nvm"
#[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# rustup
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
if

# MikanOS
#export PATH=/usr/local/Cellar/llvm/12.0.0/bin:$PATH
#export PATH="/usr/local/opt/binutils/bin:$PATH"
export PATH="/usr/local/opt/llvm@9/bin:$PATH"
export PATH="/usr/local/opt/dosfstools/sbin:$PATH"

# opam configuration
test -r /Users/ruicc/.opam/opam-init/init.zsh && . /Users/ruicc/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ruicc/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ruicc/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ruicc/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ruicc/Downloads/google-cloud-sdk/completion.zsh.inc'; fi


[ -f "/Users/ruicc/.ghcup/env" ] && source "/Users/ruicc/.ghcup/env" # ghcup-env
