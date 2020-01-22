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

. /home/share/Modules/4.1.3/init/profile.sh
# added by Miniconda3 installer
# export PATH="/home/amattfel/miniconda3/bin:$PATH"  # commented out by conda initialize
# Project-specific environments
source /home/data/cis/training-week-2019/environments

#prompt1="\[\e[1;39m\]\u@\h:\W\$\[\e[0m\]"
#PROMPT_COMMAND='PS1="\[\e[1;33m\]${project_name}\[\e[0;0m\]${prompt1} "'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/arenf001/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/arenf001/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/arenf001/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/arenf001/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f /home/share/Modules/global/profile.modules ]
then
	. /home/share/Modules/global/profile.modules
	module load slurm
fi
