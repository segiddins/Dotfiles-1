export EDITOR='vim'

export CONFIG_HOME=$HOME/.config
export ZSH_CONFIG_ROOT=$CONFIG_HOME/zsh
export VIM_CONFIG_HOME=$CONFIG_HOME/vim

if [ -f $ZSH_CONFIG_ROOT/autodetect.zsh ]; then
  source $ZSH_CONFIG_ROOT/autodetect.zsh
fi

if [ -f $ZSH_CONFIG_ROOT/history.zsh ]; then
  source $ZSH_CONFIG_ROOT/history.zsh
fi

if [ -f $HOME/.zsh.private ]; then
  source $HOME/.zsh.private
fi

plugins=(git ssh-agent)

# General
#

# Prompt

if [ -f $ZSH_CONFIG_ROOT/prompt.zsh ]; then
  source $ZSH_CONFIG_ROOT/prompt.zsh
fi

# Command Alias
#

function hexe() {
  HEXE_BIN="$HOME/development/hexe/hexe"
  if [[ -n $1 ]]; then
    exec "$HEXE_BIN" "$1"
  else
    "$HEXE_BIN"
  fi
}

## Load Configs
# Inheritance:
# zsh/alias.sh
#   zsh/$os/alias.sh

if [ -f $ZSH_CONFIG_ROOT/alias.zsh ]; then
  source $ZSH_CONFIG_ROOT/alias.zsh
fi

if [[ $LINUX = 1 ]]; then
  if [ -f $ZSH_CONFIG_ROOT/linux/alias.zsh ]; then
    source $ZSH_CONFIG_ROOT/linux/alias.zsh
  fi
elif [[ $OSX = 1 ]]; then
  if [ -f $ZSH_CONFIG_ROOT/osx/alias.zsh ]; then
    source $ZSH_CONFIG_ROOT/osx/alias.zsh
  fi
fi

## Swiftenv

if [ -x "$(command -v swiftenv)" ]; then
  export SWIFTENV_ROOT="$HOME/.swiftenv"
  export PATH="$SWIFTENV_ROOT/bin:$PATH"
  eval "$(swiftenv init -)"
fi

## ~/bin
export PATH="$HOME/bin:$PATH"

