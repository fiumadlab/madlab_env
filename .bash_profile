if [[ -f /home/share/Modules/global/profile.modules ]]; then
        . /home/share/Modules/global/profile.modules
fi
# put your own module loads here
module load gcc-8.2.0-gcc-4.8.5-sxbf4jq
module load singularity-3
module load git-2.29.0-gcc-8.2.0-wb3ybgg
module load slurm


# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

# Permissions
umask 0002
umask g+w

PATH=$PATH:$HOME/bin
PYTHONPATH="${PYTHONPATH}:/home/data/madlab/scripts"
export PATH
export PYTHONPATH
