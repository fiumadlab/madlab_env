"""sets up environment and profiles for MaDLab projects"""
import os
import time

FILES = ['.bashrc', '.bash_profile', '.projects', '.env', '.nodeload']

for f in FILES:
    if os.path.exists(os.path.expanduser('~/%s'%f)):
        now = ''.join(time.ctime().split(' ')).replace(':', '')
        newname = '~/%s_%s'%(f, now)
        cmd = 'mv ~/%s %s'%(f, newname)
        print(cmd)
        os.system(cmd)
    cmd = 'ln -s %s ~/'%os.path.abspath(f)
    print(cmd)
    os.system(cmd)

if not os.path.exists(os.path.expanduser('~/.custom_env')):
    os.system('touch ~/.custom_env')
