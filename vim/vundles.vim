" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
" Filetype off is required by vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle "gmarik/vundle"

" All your bundles here

" Ruby, Rails, Rake...
Bundle "ecomba/vim-ruby-refactoring"
Bundle "tpope/vim-rails.git"
Bundle "tpope/vim-rake.git"
Bundle "vim-ruby/vim-ruby.git"
Bundle "Keithbsmiley/rspec.vim"
Bundle "thoughtbot/vim-rspec"
Bundle "tpope/vim-dispatch"

" Other languages
Bundle "pangloss/vim-javascript"
Bundle "briancollins/vim-jst"

" Html, Xml, Css, Markdown...
Bundle "groenewege/vim-less.git"
Bundle "jtratner/vim-flavored-markdown"
Bundle "kchmck/vim-coffee-script"
Bundle "slim-template/vim-slim.git"
Bundle "tpope/vim-haml"

" Git related...
Bundle "gregsexton/gitv"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-git"

" General text editing improvements...
Bundle "Shougo/neocomplcache.git"
Bundle "briandoll/change-inside-surroundings.vim.git"
Bundle "godlygeek/tabular"
Bundle "skwp/vim-easymotion"

" File Navigation / Project Management
Bundle "kien/ctrlp.vim"
Bundle "tpope/vim-vinegar"

" Search
Bundle "rking/ag.vim"

" General vim improvements
Bundle "majutsushi/tagbar.git"
Bundle "scrooloose/syntastic.git"
Bundle "sjl/gundo.vim"
Bundle "skwp/YankRing.vim"
Bundle "tpope/vim-abolish.git"
Bundle "tpope/vim-commentary.git"
Bundle "tpope/vim-endwise.git"
Bundle "tpope/vim-eunuch.git"
Bundle "tpope/vim-ragtag.git"
Bundle "tpope/vim-repeat.git"
Bundle "tpope/vim-surround.git"
Bundle "tpope/vim-unimpaired.git"
Bundle "Keithbsmiley/investigate.vim"

" Text objects

" Cosmetics, color scheme, Powerline...
Bundle "skwp/vim-colors-solarized"
Bundle "itchyny/lightline.vim"
Bundle "vim-scripts/TagHighlight.git"

" Tmux stuff
Bundle "christoomey/vim-tmux-navigator"

"Filetype plugin indent on is required by vundle
filetype plugin indent on
