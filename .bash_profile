if [ -f /home/share/Modules/global/profile.modules ]; then
	. /home/share/Modules/global/profile.modules
# put your own module loads here
        module load slurm
        module load gcc-8.2.0-gcc-4.8.5-sxbf4jq
        # The following moudule is loaded to enable us to 
        # source activate virtual conda environments - ATM 11/18/2020
        # see change to .bashrc file at the end to evaluate potential
        # problems that may arise
        module load miniconda3-4.5.11-gcc-8.2.0-oqs2mbg 
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

