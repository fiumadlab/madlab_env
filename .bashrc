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
       *) modules_shell=sh
              ;;
esac
module() {
       eval `/home/share/Modules/default/bin/modulecmd $modules_shell $*`
}

# Source global definitions
if [ -f /etc/bashrc ]; then
       source /etc/bashrc
fi

. /home/applications/spack/applications/gcc-8.2.0/miniconda3-4.5.11-oqs2mbgv3mmo3dll2f2rbxt4plfgyqzv/etc/profile.d/conda.sh

# Get user customizations
if [ -f ~/.custom_env ]; then
       source ~/.custom_env
fi

# Project-specific environments
function madlab_env (){
       if [[ $# -eq 0 ]]; then
              h_list=`ls -a $( realpath ~/madlab_env/env ) | awk -F [._] '{print $2}'`
              echo -e "Available environments: \n ${h_list}"
       else
              eval `echo source $( realpath ~/madlab_env/env/.${1}_environment )`
       fi
}

# User specific aliases and functions
alias ls="ls --color=auto"

# Setup a fancy shell command prompt:
prompt1="\[\e[0;33m\][\A]\[\e[0m\]" # Display the time in the bash prompt
prompt2="\[\e[1;39m\]\u@\h:\W\$\[\e[0m\]" # Add username@host:dir$
promptinfo=`${HOME}/.nodeload`
PROMPT_COMMAND='PS1="\[\e[1;37m\e[44m\]${project_name}\[\e[0;0m\]${prompt1}${promptinfo}${prompt2}"'
