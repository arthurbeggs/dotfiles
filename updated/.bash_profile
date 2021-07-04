# ~/.bash_profile

# Path
export PATH=$HOME/.local/bin:$HOME/projects/other_people_projects/flutter/bin:$PATH

# Imports
[[ -f /data/common/shell/env_default_apps ]] && . /data/common/shell/env_default_apps
[[ -f /data/common/shell/env_pager_colors ]] && . /data/common/shell/env_pager_colors
[[ -f /data/common/shell/env_xdg_vars ]] && . /data/common/shell/env_xdg_vars

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start xorg/i3 after login in tty1 or wayland/sway in tty2
[[ -f /data/common/shell/script_start_gui_on_login ]] && . /data/common/shell/script_start_gui_on_login

