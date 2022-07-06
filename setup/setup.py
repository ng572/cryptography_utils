from setuptools import setup
import os
from setuptools.command.install import install
import os
# https://stackoverflow.com/a/4028943
# Python 3.5+
from pathlib import Path

class PreInstallCommand(install):
    """Pre-installation for installation mode."""
    def run(self):
        # Popen did not work very well here
        home = str(Path.home())
        bashrc = ""
        with open(f"{home}/.bashrc") as f:
            bashrc = f.read()
        append_bashrc = ""
        with open("append_bashrc") as f:
            append_bashrc = f.read()

        # cannot do a line by line comparison because will scramble the order / need to handle order
        if append_bashrc in bashrc:
            pass
        else:
            os.system("printf \"\n\" >> ~/.bashrc")
            os.system(f"cat append_bashrc >> {home}/.bashrc")
            os.system(f"cp crypto_squared {home}/Desktop")

        install.run(self)

if __name__ == "__main__":
    setup(
        cmdclass={
            'install': PreInstallCommand
        }
    )
#    import subprocess
#    result = subprocess.check_output("git tag", shell=True)
#    setup(version=result)
