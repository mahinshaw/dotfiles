" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :NeoBundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +NeoBundleClean! +NeoBundleInstall +qall
" Filetype off is required by vundle
filetype off

set rtp+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))

" let NeoBundle manage Neobundle (required)
NeoBundleFetch "Shougo/neobundle.vim"

" All your bundles here

NeoBundle "Shougo/vimproc.vim", { 'build': {
  \   'windows': 'make -f make_mingw32.mak',
  \   'cygwin': 'make -f make_cygwin.mak',
  \   'mac': 'make -f make_mac.mak',
  \   'unix': 'make -f make_unix.mak',
  \ } }

" Unite
NeoBundle "Shougo/unite.vim"
NeoBundle "Shougo/unite-outline"
NeoBundle "Shougo/neomru.vim"

" Ruby, Rails, Rake...
NeoBundle "ecomba/vim-ruby-refactoring"
NeoBundle "tpope/vim-rails.git"
NeoBundle "tpope/vim-rake.git"
NeoBundle "tpope/vim-bundler.git"
NeoBundle "vim-ruby/vim-ruby.git"
NeoBundle "Keithbsmiley/rspec.vim"
NeoBundle "thoughtbot/vim-rspec"
NeoBundle "tpope/vim-dispatch"

" Haskell
NeoBundle "dag/vim2hs"
NeoBundle "eagletmt/neco-ghc"

" JVM Languages
"NeoBundle "derekwyatt/vim-scala"
"NeoBundle "derekwyatt/vim-sbt"

" MONO!?!
NeoBundle "timrobinson/fsharp-vim"
NeoBundle "OrangeT/vim-csharp"
NeoBundle "nosami/Omnisharp"

" Other languages
NeoBundle "pangloss/vim-javascript"
NeoBundle "briancollins/vim-jst"
NeoBundle "othree/javascript-libraries-syntax.vim"

" Html, Xml, Css, Markdown...
NeoBundle "groenewege/vim-less.git"
NeoBundle "jtratner/vim-flavored-markdown"
NeoBundle "kchmck/vim-coffee-script"
NeoBundle "slim-template/vim-slim.git"
NeoBundle "tpope/vim-haml"
NeoBundle "suan/vim-instant-markdown"

" Git related...
NeoBundle "gregsexton/gitv"
NeoBundle "tpope/vim-fugitive"
NeoBundle "tpope/vim-git"

" General text editing improvements...
NeoBundle "Shougo/neocomplete.git"
NeoBundle "briandoll/change-inside-surroundings.vim.git"
NeoBundle "godlygeek/tabular"
NeoBundle "skwp/vim-easymotion"

" File Navigation / Project Management
" NeoBundle "kien/ctrlp.vim"
NeoBundle "tpope/vim-vinegar"

" Search
NeoBundle "rking/ag.vim"

" General vim improvements
NeoBundle "majutsushi/tagbar.git"
NeoBundle "scrooloose/syntastic.git"
NeoBundle "sjl/gundo.vim"
" NeoBundle "skwp/YankRing.vim"
NeoBundle "tpope/vim-abolish.git"
NeoBundle "tpope/vim-commentary.git"
NeoBundle "tpope/vim-endwise.git"
NeoBundle "tpope/vim-eunuch.git"
NeoBundle "tpope/vim-ragtag.git"
NeoBundle "tpope/vim-repeat.git"
NeoBundle "tpope/vim-surround.git"
NeoBundle "tpope/vim-unimpaired.git"
NeoBundle "Keithbsmiley/investigate.vim"

" Text objects

" Cosmetics, color scheme, Powerline...
NeoBundle "altercation/vim-colors-solarized"
NeoBundle "itchyny/lightline.vim"
NeoBundle "vim-scripts/TagHighlight.git"

" Tmux stuff
NeoBundle "christoomey/vim-tmux-navigator"

call neobundle#end()

"Filetype plugin indent on is required by vundle
filetype plugin indent on

" Installation check
NeoBundleCheck
