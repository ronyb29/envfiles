# basic stuff
brew install iterm2 rectangle starship zsh-completions zsh-syntax-highlighting google-cloud-sdk coscreen

# devtools 
brew install python@3.11 python@3.10 pipx postgresql@14 plantuml 
pipx ensurepath
pipx install poetry


# docker + colima
brew install colima docker docker-completion docker-buildx 
sudo ln -sf /Users/$USER/.colima/default/docker.sock /var/run/docker.sock

# nvm 
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash