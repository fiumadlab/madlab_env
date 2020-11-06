if [ -f /home/share/Modules/global/profile.modules ]; then
	. /home/share/Modules/global/profile.modules
# put your own module loads here
        module load slurm
        module load gcc
fi
if [ $(rpm --eval '${centos_ver}') == "7" ]; then
         . /home/share/Modules/4.1.3/init/profile.sh
         module load singularity-3
fi

module load git
module load slurm


# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.custom_env ]; then
        . ~/.custom_env
fi


# User specific environment and startup programs
# Permissions
umask 0002
umask g+w

PYTHONPATH=~/miniconda3/bin
export PYTHONPATH

PATH=${PYTHONPATH}:${PATH}:${HOME}/bin
export PATH

