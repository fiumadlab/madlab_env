if [ -f /home/share/Modules/global/profile.modules ]; then
	. /home/share/Modules/global/profile.modules
        . /home/share/Modules/4.1.3/init/profile.sh
# put your own module loads here
        module load singularity-3
        module load slurm
        module load git-2.19.1-gcc-8.2.0-3vhlie7
        module load miniconda3-4.5.11-gcc-8.2.0-oqs2mbg
        . /home/applications/spack/applications/gcc-8.2.0/miniconda3-4.5.11-oqs2mbgv3mmo3dll2f2rbxt4plfgyqzv/etc/profile.d/conda.sh 
fi

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

# Permissions
umask 0002

PATH=$PATH:$HOME/bin
PYTHONPATH="${PYTHONPATH}:/home/data/madlab/scripts"

export PATH
export PYTHONPATH
