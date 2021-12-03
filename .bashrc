# Notes on .bash* files:
#
# .bash_profile - loaded in interactive/login shells,
#    add commands here that should only be executed once
#    e.g. module loads, PATH updates.
#
# .bashrc - loaded for non-interactive/subshells,
#    add commands to be done for each new shell
#    e.g. aliases, customizations, functions.
#    These are made available to login shell via
#    "source ~/.bashrc".
#
# .custom_env - non-standard madlab environmental file,
#    used to hold user-specified aliases, functions,
#    etc. (which are typically held in .bashrc) since
#    .bashrc is controlled by fiumadlab/madlab_env.git

# Initialize module for sh shells
case "$0" in
       -sh|sh|*/sh) modules_shell=sh
              ;;
       -ksh|ksh|*/ksh) modules_shell=ksh
              ;;
       -zsh|zsh|*/zsh) modules_shell=zsh
              ;;
       -bash|bash|*/bash) modules_shell=bash
              ;;
       *) echo "Setting sh as default shell" >&1
              modules_shell=sh
              ;;
esac
module() {
       eval `/home/share/Modules/default/bin/modulecmd $modules_shell $*`
}

# Source global definitions
if [ -f /etc/bashrc ]; then
       source /etc/bashrc
fi

# Get user customizations
if [ -f ~/.custom_env ]; then
       source ~/.custom_env
fi

# Project-specific environments
source ~/.projects

# User specific aliases and functions
alias ls="ls --color=auto"

# Setup a fancy shell command prompt:
prompt1="\[\e[0;33m\][\A]\[\e[0m\]" # Display the time in the bash prompt
prompt2="\[\e[1;39m\]\u@\h:\W\$\[\e[0m\]" # Add username@host:dir$
promptinfo=`${HOME}/.nodeload`
PROMPT_COMMAND='PS1="\[\e[1;37m\e[44m\]${project_name}\[\e[0;0m\]${prompt1}${promptinfo}${prompt2}"'
