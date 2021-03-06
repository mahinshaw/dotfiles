my dotfiles
===========

Requirements
------------

Install Vim with lua for [neocomplete](https://github.com/Shougo/neocomplete.vim)

    brew (re)install vim --with-lua

Change the shell to Z-Shell

    chsh -s /bin/zsh

Get [Prezto](https://github.com/sorin-ionescu/prezto)

    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

Install [rcm](https://github.com/thoughtbot/rcm)

    brew tap thoughtbot/formulae
    brew install rcm

Recommended
-----------

Install [iTerm2](www.iterm2.com)

Install MacVim

    brew install macvim --with-cscope --with-lua --HEAD

Install
-------

Cone the repo on your machine:

    git clone https://github.com/mahinshaw/dotfiles.git ~/.dotfiles

Install:

    rcup

The Current homebrew install is not up to date with source, and the hooks don't fire by default.
Symlinks will be created in your home directory.

Update
------

Stay up to date

    cd ~/.dotfiles && git pull origin master

    cd && rcup -x README.md

What's in it?
-------------

[vim](https://www.vim.org/) configurations:

* lots and lots of stuff that i need to list and that i have copied from lots of people way smarter than me.

[zsh](www.zsh.org) configurations:

* Thanks to Prezto.

Todo
----
* Learn more about tmux and integrate this as well.

Credits
-------

[YADR](https://github.com/skwp/dotfiles) : Showed me what vim could do and inspired me to do my own work.

[Thoughbot](https://github.com/thoughbot/dotfiles) : More good learning from these guys.  You can find `rcm` here.
