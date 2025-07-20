# dotfiles

## Requirements

Get [Prezto](https://github.com/sorin-ionescu/prezto)

    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

Install [rcm](https://github.com/thoughtbot/rcm)

    brew tap thoughtbot/formulae
    brew install rcm

Install [Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)

    brew (re)install neovim

Change the shell to Z-Shell

    chsh -s /bin/zsh # or /opt/homebrew/bin/zsh

Note: if you want to use Homebrew zshell, you need to update the /etc/shells file to include the path to the Homebrew zsh binary, which is usually located at `/usr/local/bin/zsh` or `/opt/homebrew/bin/zsh` on Apple Silicon Macs.

## Recommended

Install [iTerm2](www.iterm2.com) or [Wezterm](https://wezterm.org/)

## Install

Cone the repo on your machine:

    git clone https://github.com/mahinshaw/dotfiles.git ~/.dotfiles

Install:

    rcup

The Current homebrew install is not up to date with source, and the hooks don't fire by default.
Symlinks will be created in your home directory.

## Update

Stay up to date

    cd ~/.dotfiles && git pull origin master

    cd && rcup -x README.md
