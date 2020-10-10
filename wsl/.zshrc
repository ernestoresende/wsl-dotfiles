# Path to your oh-my-zsh installation.
export ZSH="/home/ernesto/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Loads Node Version Manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Loads Java SDK
JAVA_HOME=$(dirname $( readlink -f $(which java) ))
JAVA_HOME=$(realpath "$JAVA_HOME"/../)
export JAVA_HOME

# Android environment variables
export ANDROID_HOME=$HOME/Android
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/tools:$PATH
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/tools/bin:$PATH
export PATH=$PATH:$ANDROID_HOME/platform-tools:$PATH

# Pass AD
export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d' ' -f2)
export ADB_SERVER_SOCKET=tcp:$WSL_HOST:5037

plugins=(git)

source $ZSH/oh-my-zsh.sh

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
