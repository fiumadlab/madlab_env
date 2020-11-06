import os
import time

files = [".bashrc", ".bash_profile", ".projects", ".nodeload"]

for file_name in files:
    out_file = os.path.expanduser(f"~/{file_name}")
    if os.path.islink(out_file):
        break
    sym_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), file_name)
    if os.path.exists(out_file):
        now = "".join(time.ctime().split(" ")).replace(":", "")
        os.rename(out_file, f"{out_file}_{now}")
    os.symlink(sym_path, out_file)

cust_file = os.path.join(os.path.expanduser("~/.custom_env"))
if not os.path.exists(cust_file):
    open(cust_file, "w").close()
