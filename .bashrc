case "$0" in
          -sh|sh|*/sh)	modules_shell=sh ;;
       -ksh|ksh|*/ksh)	modules_shell=ksh ;;
       -zsh|zsh|*/zsh)	modules_shell=zsh ;;
    -bash|bash|*/bash)	modules_shell=bash ;;
esac
module() { eval `/home/share/Modules/default/bin/modulecmd $modules_shell $*`; }
#module() { eval `/bin/modulecmd $modules_shell $*`; }
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Project specific environments
source ~/.projects

# Permissions
umask 0002

# User specific aliases and functions
# Added by Cassian 03/29/2016
umask g+w
alias ls="ls --color=auto"
# Setup a fancy shell command prompt:
prompt1="\[\e[0;33m\][\A]\[\e[0m\]" # Display the time in the bash prompt
prompt2="\[\e[1;39m\]\u@\h:\W\$\[\e[0m\]" # Add username@host:dir$
promptinfo=`${HOME}/.nodeload`
PROMPT_COMMAND='PS1="\[\e[1;37m\e[44m\]${project_name}\[\e[0;0m\]${prompt1}${promptinfo}${prompt2}"'

#Some handy aliases for navigating MaDLab directory structure
export EMU_DATA='/home/data/madlab/data/mri/emu/'
export WMAZE_DATA='/home/data/madlab/data/mri/wmaze/'
export MAD_SCRIPTS='/home/data/madlab/scripts/'
export MAD_SURF='/home/data/madlab/surfaces/'
export MAD_DATA='/home/data/madlab/data/'


#Function to forward jupyter notebooks on the HPC to the correct port for running
#on a local machine with port forwarding enabled
#ex: jupforward 8889 would run the command
#'jupyter notebook --no-browser --port=8889'
function jupforward() {
  jupyter notebook --no-browser --port=$1
  }
