"""sets up environment and profiles for MaDLab projects"""
import os
import time

FILES = ['.bashrc', '.bash_profile', '.projects', '.env', '.nodeload']

for f in FILES:
    if os.path.exists(os.path.expanduser('~/{0}'.format(f))):
        now = ''.join(time.ctime().split(' ')).replace(':', '')
        newname = '~/{0}_{1}'.format(f, now)
        cmd = 'mv ~/{0} {1}'.format(f, newname)
        print(cmd)
        os.system(cmd)
    cmd = 'ln -s {} ~/'.format(os.path.abspath(f))
    print(cmd)
    os.system(cmd)

if not os.path.exists(os.path.expanduser('~/.custom_env')):
    os.system('touch ~/.custom_env')
