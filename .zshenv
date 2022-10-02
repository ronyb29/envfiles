export PIPENV_VERBOSITY=-1
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export CLICOLOR=1

# local postgres 12 in path
export PATH="$PATH:/usr/local/opt/postgresql@12/bin"
# add packages installed by pipx to path
export PATH="$PATH:$HOME/.local/bin"
# add other python versions at the end of path
export PATH="$PATH:/usr/local/opt/python@3.9/libexec/bin" #unversioned executables (python, pip, etc)
export PATH="$PATH:/usr/local/opt/python@3.9/bin"
export PATH="$PATH:/usr/local/opt/python@3.7/bin"
export PATH="$PATH:/usr/local/opt/python@3.8/bin"
export PATH="$PATH:/usr/local/opt/python@3.10/bin"
