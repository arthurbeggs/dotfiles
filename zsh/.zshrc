# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="lambda-mod"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( archlinux common-aliases git git-extras history sudo vagrant web-search wd )

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

export GPG_TTY=$(tty)

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  ### Enable Wayland support for GTK and QT if running Wayland
  export GDK_BACKEND=wayland
  export QT_QPA_PLATFORM=wayland-egl
  export QT_SELECT=5
  export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
  sway
fi

if [[ ! $DISPLAY && $XDG_VTNR -eq 2 ]]; then
  startx
fi

source $ZSH/oh-my-zsh.sh

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

### Alias to view files with less
alias v="less"

### Alias to shutdown
alias kthxbye="shutdown -P now"

### Run sudo with user environment
alias sudo="sudo -H"

### Exit terminal
alias :q="exit"

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

