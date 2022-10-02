# custom zsh config
fpath+=~/.zfunc  # this path will have custom completions

# Add Poetry completions (if not exist)
[ -s "~/.zfunc/_poetry" ] && poetry completions zsh > ~/.zfunc/_poetry

# brew auto completion
if type brew &>/dev/null; then
    fpath+=$(brew --prefix)/share/zsh-completions
fi

# NVM setup
# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .zshrc gets sourced multiple times
# by checking whether __init_nvm is a function.
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ] && [ ! "$(whence -w __init_nvm)" = "__init_nvm: function" ]; then
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack' 'rush', 'rushx')
  function __init_nvm() {
    for i in "${__node_commands[@]}"; do unalias $i; done
    . "$NVM_DIR"/nvm.sh
    unset __node_commands
    unset -f __init_nvm
  }
  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi


alias loadpypi="export PYPIUSER="readonly" && export PYPIPASS=$(security find-generic-password -a $USER -s 'PYPIPASS' -w)"


# ZSH completion
zstyle ':completion:*' menu select 
export CLOUDSDK_PYTHON="/usr/local/bin/python3.9"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
# add  pipx autocomplete
eval "$(register-python-argcomplete pipx)"


# starship prompt init
eval "$(starship init zsh)"