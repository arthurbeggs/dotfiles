### Sourced @ login shell

### Path
export PATH="$HOME"/.local/bin:"$PATH"

### Disable accessibility in QT and GTK
export QT_ACCESSIBILITY=0
export NO_AT_BRIDGE=1

### Base16 Eighties Color Theme
if [ "$TERM" = "linux" ]; then
  echo -en "\\e]P02D2D2D"
  echo -en "\\e]P1F2777A"
  echo -en "\\e]P299CC99"
  echo -en "\\e]P3FFCC66"
  echo -en "\\e]P46699CC"
  echo -en "\\e]P5CC99CC"
  echo -en "\\e]P666CCCC"
  echo -en "\\e]P7D3D0C8"
  echo -en "\\e]P8747369"
  echo -en "\\e]P9F2777A"
  echo -en "\\e]PA99CC99"
  echo -en "\\e]PBFFCC66"
  echo -en "\\e]PC6699CC"
  echo -en "\\e]PDCC99CC"
  echo -en "\\e]PE66CCCC"
  echo -en "\\e]PFF2F0EC"
fi

export EDITOR="nvim"
export VISUAL="nvim"

### GnuPG & SSH
eval $(ssh-agent -s -t 86400)

###################################
###   XDG compliance for apps   ###
###################################
### Atom
export ATOM_HOME="$XDG_DATA_HOME"/atom

### AWS CLI
# export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
# export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config

### Ruby Bundle
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle

### Rust Cargo
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine

### Emscripten
# export EM_CONFIG="$XDG_CONFIG_HOME"/emscripten/config
# export EM_CACHE="$XDG_CACHE_HOME"/emscripten/cache
# export EM_PORTS="$XDG_DATA_HOME"/emscripten/cache
# emcc --em-config "$XDG_CONFIG_HOME"/emscripten/config --em-cache "$XDG_CACHE_HOME"/emscripten/cache

### Interactive Ruby
export IRBRC="$XDG_CONFIG_HOME"/irb/irbrc

### Java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

### less
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

### Node.js
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

### npm
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

### Ruby Gems
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem

### rustup
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

### Uncrustify
export UNCRUSTIFY_CONFIG="$XDG_CONFIG_HOME"/uncrustify/uncrustify.cfg

### Vagrant
export VAGRANT_HOME="$XDG_DATA_HOME"/vagrant
export VAGRANT_ALIAS_FILE="$XDG_DATA_HOME"/vagrant/aliases

### Wine
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default

