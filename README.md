my dotfiles
===========

Requirements
------------

Change the shell to Z-Shell

    chsh -s /bin/zsh

Install [Prezto](https://github.com/sorin-ionescu/prezto)

    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

Install [rcm](https://github.com/thoughtbot/rcm)

    brew tap thoughtbot/rcm
    brew install rcm

Recommended
-----------

Install iTerm2

Install MacVim

    brew install macvim

Install
-------

Cone the repo on your machine:

    git clone https://github.com/mahinshaw/dotfiles.git ~/.dotfiles

Install:

    RCRC="rcrc" rcup -k

or

    rcup -k -x README.md

The Current homebrew install is not up to date with source, and the hooks don't fire by default.
Symlinks will be created in your home directory.

Update
------

Stay up to date

    cd ~/.dotfiles && git pull origin master

    cd && rcup -k

What's in it?
-------------

[vim](https://www.vim.org/) configurations:

* lots and lots of stuff that i need to list and that i have copied from lots of people way smarter than me.

Todo
----
* Learn more about tmux and integrate this as well.

Credits
-------

[YADR](https://github.com/skwp/dotfiles) : Showed me what vim could do and inspired me to do my own work.

[Thoughbot](https://github.com/thoughbot/dotfiles) : More good learning form these guys.  You can find `rcm` here.
