# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="lambda-mod"

# Uncomment the following line to use hyphen-insensitive completion.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load?
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=( archlinux common-aliases fzf git git-extras history vagrant web-search wd )

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

export GPG_TTY=$(tty)

export PATH="$HOME"/.bin:"$PATH"

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  ### Enable Wayland support for GTK and QT if running Wayland
  export GDK_BACKEND=wayland
  export CLUTTER_BACKEND=wayland
  export GTK_THEME=Arc-Dark-solid

  export QT_QPA_PLATFORM=wayland-egl
  export QT_WAYLAND_FORCE_DPI=physical
  export QT_SELECT=5
  export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

  ### Fix Java apps
  export _JAVA_AWT_WM_NONREPARENTING=1

  ### SDL support for Wayland
  export SDL_VIDEODRIVER=wayland

  ### Force Firefox to use Wayland
  export MOZ_ENABLE_WAYLAND=1

  sway
fi

if [[ ! $DISPLAY && $XDG_VTNR -eq 2 ]]; then
  startx
fi

source $ZSH/oh-my-zsh.sh

### Enable vi mode
bindkey -v
export KEYTIMEOUT=2
function zle-line-init zle-keymap-select {
    case $KEYMAP in
        vicmd) print -n '\e]12;#cc241d\a';;
        viins|main) print -n '\e]112;\a';;
    esac
}
zle -N zle-line-init
zle -N zle-keymap-select

# Use vim cli mode
bindkey '^p' up-history
bindkey '^n' down-history

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
# bindkey '^r' history-incremental-search-backward

### Alias to never remove root
alias rm="rm --preserve-root"

### Alias to edit with nvim
alias e="nvim"
alias vi="nvim"
alias vim="nvim"
alias se="sudo -H nvim"

### Easily edit .zshrc
alias ezsh="nvim $ZDOTDIR/.zshrc"

### Easily edit i3 config file
alias ei3="nvim $XDG_CONFIG_HOME/i3/config"

### Easily edit sway config file
alias esway="nvim $XDG_CONFIG_HOME/sway/config"

### Easily edit Neovim init.vim
alias envim="nvim $XDG_CONFIG_HOME/nvim/init.vim"

### Easily edit polybar
alias epoly="nvim $XDG_CONFIG_HOME/polybar/config"

### Easily edit waybar
alias eway="nvim $XDG_CONFIG_HOME/waybar/config"

### Easily edit redshift
alias ered="nvim $XDG_CONFIG_HOME/redshift/redshift.conf"

### Update nvim plugins
alias eupdate="nvim +PlugInstall +PlugUpdate +UpdateRemotePlugins +qa"

### Alias to view files with less
alias v="less"

### Alias to shutdown
alias kthxbye="shutdown -P now"

### Run sudo with user environment
alias sudo="sudo -H"

### Exit terminal
alias :q="exit"
alias q="exit"

### Grep running processes
alias psg="ps -aux | grep"

### Diff directories
alias diffdir="diff -ENwbur "

### Edit brightness
alias -g bkl=" | sudo tee /sys/class/backlight/intel_backlight/brightness"

### ls -lash alias
alias lss="ls -lash"

### Save clipboard image
alias savepng="wl-paste -t image/png > "

### Record screen
alias record='wf-recorder -g "$(slurp)"'

### Create Python venv
alias venv_create="python -m venv .env"

### Activate project venv
alias venv_activate="source .env/bin/activate"

### Generate SSH keys
alias gened25519="ssh-keygen -t ed25519 -o -a 100"
alias genrsa="ssh-keygen -t rsa -b 4096 -o -a 100"

### Start SSH Agent with GitHub key
# alias gh='eval "$(ssh-agent -s -t 86400)" && ssh-add ~/.ssh/github/id_ed25519'
alias gh='ssh-add ~/.ssh/github/id_ed25519'

### Start GnuPG Agent
# alias sign='eval $(gpg-agent)'

### Fetch and track all remote branches
# alias superfetch='for remote in `git branch -r`; do git branch --track ${remote#origin/} $remote; done'


### Integrate fzf
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
source /usr/share/fzf/completion.zsh && source /usr/share/fzf/key-bindings.zsh

### Syntax highlighting must be the last command
source /usr/share/oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

