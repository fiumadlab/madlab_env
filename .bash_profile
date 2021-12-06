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

# Initialize modules for sh shells
if [[ -f /home/share/Modules/global/profile.modules ]]; then
        . /home/share/Modules/global/profile.modules
fi

# Load relevant modules, miniconda
module load gcc-8.2.0-gcc-4.8.5-sxbf4jq
module load singularity-3
module load git-2.29.0-gcc-8.2.0-wb3ybgg
module load slurm

# Permissions
umask 0002
umask g+w

# User specific environment and startup programs
# PATH=$PATH:$HOME/bin
# export PATH
# PYTHONPATH="${PYTHONPATH}:/home/data/madlab/scripts"
# export PYTHONPATH

# Make aliases and customizations available.
if [ -f ~/.bashrc ]; then
        source ~/.bashrc
fi
