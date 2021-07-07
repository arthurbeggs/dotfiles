# ~/.bash_profile

# Path
export PATH=$HOME/.local/share/bin:$PATH

# Imports
[[ -f /data/common/shell/env_default_apps ]] && . /data/common/shell/env_default_apps
[[ -f /data/common/shell/env_pager_colors ]] && . /data/common/shell/env_pager_colors
[[ -f /data/common/shell/env_xdg_vars ]] && . /data/common/shell/env_xdg_vars

[[ -f ~/.bashrc ]] && . ~/.bashrc

