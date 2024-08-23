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
stow gnupg -t $HOME/.gnupg/