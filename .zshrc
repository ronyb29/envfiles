# custom zsh config
fpath+=~/.zfunc  # this path will have custom completions

# Add Poetry completions (if not exist)
[ ! -s ~/.zfunc/_poetry ] && poetry completions zsh > ~/.zfunc/_poetry

# brew auto completion
if type brew &>/dev/null; then
    fpath+=$(brew --prefix)/share/zsh-completions
    fpath+=$(brew --prefix)/share/zsh/site-functions
fi

# NVM setup
# Defer initialization of nvm until you "use" it
# Call `nvm use` to load a node version. Defaults to the latest LTS.
export NVM_DIR="$HOME/.nvm"
[ -s $NVM_DIR/nvm.sh ] && . "$NVM_DIR/nvm.sh" --no-use
[ ! -s ~/.nvmrc ] && echo "lts/*" > .nvmrc

# ZSH completion
zstyle ':completion:*' menu select 
export CLOUDSDK_PYTHON="/usr/local/bin/python3.9"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# add pipx autocomplete
eval "$(register-python-argcomplete pipx)"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# starship prompt init
eval "$(starship init zsh)"