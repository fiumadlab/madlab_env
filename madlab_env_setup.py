import os
import time
from subprocess import Popen

files = ['.bashrc', '.bash_profile', '.projects', '.nodeload']

for file_name in files:
    sym_path = os.path.dirname(os.path.realpath(__file__)) + '/' + file_name
    print(sym_path)
    if os.path.exists(os.path.expanduser('~/{0}'.format(file_name))):
        now = ''.join(time.ctime().split(' ')).replace(':', '')
        newname = '~/%s_%s' % (file_name, now)
        cmd = 'mv ~/%s %s' % (file_name, newname)
        print(cmd)
        Popen(cmd, shell=True).wait()
    cmd = 'ln -s %s ~/' % os.path.abspath(sym_path)
    print(cmd)
    Popen(cmd, shell=True).wait()

if not os.path.exists(os.path.expanduser('~/.custom_env')):
    Popen('touch ~/.custom_env', shell=True).wait()
