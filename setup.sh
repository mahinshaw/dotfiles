#!/usr/bin/env bash

#install homebrew
eval "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# # pull git repo for dotfiles
# git clone https://github.com/mahinshaw/dotfiles ~/.dotfiles

# cd ~/.dotfiles

#install brew bundle Brewfile
brew bundle

## TODO - set brew `bin` on path for this script.

# install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# use zsh
chsh -s $(which zsh)

# use prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
