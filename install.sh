# Restore brew installed apps based on Brewfile
brew bundle install

# https://github.com/zdharma-continuum/zinit?tab=readme-ov-file#install
bash -c "$(curl --fail --show-error --silent \
    --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# https://www.jetify.com/devbox/docs/installing_devbox/
curl -fsSL https://get.jetify.com/devbox | bash

# ZSH Config
stow zsh -t $HOME

# Git Config
stow git -t $HOME

# GNUPG Config
if [ ! -d "$HOME/.gnupg" ]; then
    mkdir $HOME/.gnupg
fi
stow gnupg -t $HOME/.gnupg/

# Nix Config
if [ ! -d "$HOME/.config/nixpkgs" ]; then
    mkdir -p $HOME/.config/nixpkgs
fi
stow nix -t $HOME/.config/nixpkgs/

# Zellij Config
if [ ! -d "$HOME/.config/zellij" ]; then
    mkdir -p $HOME/.config/zellij
fi
stow zellij -t $HOME/.config/zellij/