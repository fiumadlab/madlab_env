if [ -f /home/share/Modules/global/profile.modules ]; then
	. /home/share/Modules/global/profile.modules
# put your own module loads here
        #module load slurm/17.02.2
        module load slurm
	#module load lsf
        module load gcc
fi
#export CENTOS_VER=$(rpm --eval '%{centos_ver}')
if [ $(rpm --eval '%{centos_ver}') == "7" ]; then 
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

