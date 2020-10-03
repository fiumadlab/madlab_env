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

# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

# Permissions
umask 0002

PATH=$PATH:$HOME/bin
# ATM added during October setup
#ANTSPATH=${ANTSPATH:="/home/applications/ANTs/1.9.4/bin/"}
PYTHONPATH="${PYTHONPATH}:/home/data/madlab/scripts"

export PATH
# ATM added during October setup
export PYTHONPATH
#export ANTSPATH

