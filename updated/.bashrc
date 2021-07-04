### If not running interactively, don't do anything
[[ $- != *i* ]] && return

### Imports in interactive shell
[[ -f /data/common/shell/env_aliases ]] && . /data/common/shell/env_aliases
[[ -f /data/common/shell/env_shared_history ]] && . /data/common/shell/env_shared_history
[[ -f /data/common/shell/script_start_ssh_agent ]] && . /data/common/shell/script_start_ssh_agent
[[ -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
[[ -f /usr/share/git/completion/git-prompt.sh ]] && . /usr/share/git/completion/git-prompt.sh

### Functions
[[ -f /data/common/shell/func_simple_functions ]] && . /data/common/shell/func_simple_functions

# Enable extended globbing
shopt -s extglob

# Prepend 'cd' if only a path is given
shopt -s autocd

# Behave well on window resize
shopt -s checkwinsize

# Set history sizes
HISTSIZE=1000
HISTFILESIZE=20000

# Set window name outside tmux
if [[ -z $TMUX ]]; then
    PROMPT_COMMAND="${PROMPT_COMMAND};echo -ne \"\033]0;\${USER}@\${HOSTNAME%%.*} [\${PWD/#\$HOME/\~}]\007\""
fi

### Prompt
BOLD="\[$(tput bold)\]"
RED="$(tput setaf 9)"
GREEN="$(tput setaf 10)"
YELLOW="$(tput setaf 11)"
BLUE="$(tput setaf 12)"
MAGENTA="$(tput setaf 13)"
RESET="\[$(tput sgr0)\]"

ps_user() {
    local __output=""
    if [[ ${USER} == "root" ]]; then
        __output="${RED}${USER}"
    else
        __output="${YELLOW}${USER}"
    fi
    if [[ ${HOSTNAME} != "caterpillar" ]]; then
        __output="${OUTPUT}@${YELLOW}${HOST}"
    fi
    echo ${__output}
}

ps_status() {
    [[ $? == 0 ]] && echo "${GREEN}:)" || echo "${RED}:c"
}

PS1="${BOLD}\$(ps_status) \$(ps_user) ${MAGENTA}[\w]${BLUE}\$(__git_ps1 ' (%s)') \n»» ${RESET}"


export QSYS_ROOTDIR="/home/arthur/.cache/yay/quartus-free/pkg/quartus-free/opt/altera/18.1/quartus/sopc_builder/bin"
