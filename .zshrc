# Path to my oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"

# Path to my Go installation
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# Path to my flutter installation.
export PATH="$PATH:/Users/$USER/Developer/flutter/bin"


# alias section
[[ -f ~/.aliases ]] && source ~/.aliases


# custom commands
. /Users/$USER/temp/cmdz/direct


# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# bash insulter
if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi

# macfeh
function macfeh() {
    open -b "drabweb.macfeh" "$@"
}

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

DISABLE_AUTO_UPDATE="true"
# DISABLE_LS_COLORS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"



####################################
# **  PLUGINS AND ADDITIONALS  **  #
####################################

# thefuck
eval $(thefuck --alias)

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew
# https://github.com/zsh-users/zsh-syntax-highlighting
# https://github.com/zsh-users/zsh-autosuggestions
# https://github.com/nvbn/thefuck
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/frontend-search
plugins=(git zsh-syntax-highlighting brew zsh-autosuggestions dotenv safe-paste thefuck frontend-search)


ZSH_DOTENV_FILE=.dotenv

source $ZSH/oh-my-zsh.sh

# prompt
autoload -U promptinit; promptinit
zstyle :prompt:pure:path color blue
zstyle :prompt:pure:git:dirty color green
prompt pure

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
