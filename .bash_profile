if [ -f /home/share/Modules/global/profile.modules ]
then
	. /home/share/Modules/global/profile.modules
# put your own module loads here
	module load lsf
        module load gcc/4.8.1 
fi
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
ANTSPATH=${ANTSPATH:="/home/applications/ANTs/1.9.4/bin/"}
PYTHONPATH="${PYTHONPATH}:/home/data/madlab/scripts"

export PATH
# ATM added during October setup
export PYTHONPATH
export ANTSPATH

<<<<<<< HEAD
alias MAD_DATA='/home/data/madlab/data'
=======
>>>>>>> 80c81d62287536f3011d4ea7c58a1ed912c13709
