### Configure XDG directories
export XDG_DATA_HOME=$HOME/.data
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config

export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

### Change dotfile directory
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export HISTFILE="$XDG_DATA_HOME"/zsh/history
source $ZDOTDIR/.zshenv

