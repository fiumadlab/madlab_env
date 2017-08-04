"""sets up environment and profiles for MaDLab projects"""
import os
import time

<<<<<<< HEAD
FILES = ['.bashrc', '.bash_profile','.env','.projects', '.nodeload']
=======
FILES = ['.bashrc', '.bash_profile', '.projects', '.env', '.nodeload']
>>>>>>> 80c81d62287536f3011d4ea7c58a1ed912c13709

for f in FILES:
    if os.path.exists(os.path.expanduser('~/{0}'.format(f))):
        now = ''.join(time.ctime().split(' ')).replace(':', '')
        newname = '~/{0}_{1}'.format(f, now)
        cmd = 'mv ~/{0} {1}'.format(f, newname)
        print(cmd)
        os.system(cmd)
<<<<<<< HEAD
    cmd = 'ln -s {0} ~/'.format(os.path.abspath(f))
=======
    cmd = 'ln -s {} ~/'.format(os.path.abspath(f))
>>>>>>> 80c81d62287536f3011d4ea7c58a1ed912c13709
    print(cmd)
    os.system(cmd)

if not os.path.exists(os.path.expanduser('~/.custom_env')):
    os.system('touch ~/.custom_env')
