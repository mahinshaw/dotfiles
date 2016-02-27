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

NeoBundle "Shougo/vimproc.vim", {
  \ 'build': {
  \    'windows': 'tools\\update-dll-mingw',
  \    'cygwin': 'make -f make_cygwin.mak',
  \    'mac': 'make -f make_mac.mak',
  \    'unix': 'make -f make_unix.mak',
  \   },
  \ }

" Unite
NeoBundle "Shougo/unite.vim"
NeoBundle "Shougo/unite-outline"
NeoBundle "Shougo/neomru.vim"
NeoBundle "Shougo/neocomplete.vim"

" Ruby, Rails, Rake...
" NeoBundle "ecomba/vim-ruby-refactoring"
" NeoBundle "tpope/vim-rails.git"
" NeoBundle "tpope/vim-rake.git"
" NeoBundle "tpope/vim-bundler.git"
" NeoBundle "vim-ruby/vim-ruby.git"
" NeoBundle "Keithbsmiley/rspec.vim"
" NeoBundle "thoughtbot/vim-rspec"

" Haskell
" NeoBundle "dag/vim2hs"
" NeoBundle "Twinside/vim-hoogle"
" NeoBundle "eagletmt/neco-ghc"
" NeoBundle "eagletmt/ghcmod-vim"
" NeoBundle "bitc/hdevtools"

" Clojure
NeoBundle "kien/rainbow_parentheses.vim"
" NeoBundle "amdt/vim-niji"
NeoBundle "guns/vim-clojure-static"
NeoBundle "guns/vim-clojure-highlight"
NeoBundle "guns/vim-slamhound"
NeoBundle "guns/vim-sexp"
NeoBundle "tpope/vim-sexp-mappings-for-regular-people"
NeoBundle "tpope/vim-fireplace"
NeoBundle "tpope/vim-leiningen"
NeoBundle "tpope/vim-classpath"

" MONO!?!
" NeoBundle "fsharp/fsharpbinding", {
"           \ 'description': 'F# support for Vim',
"           \ 'rtp': 'vim',
"           \ 'lazy': 1,
"           \ 'autoload': {'filetypes': 'fsharp'},
"           \ 'build': {
"           \   'mac':   'make -C vim fsautocomplete',
"           \   'linux': 'make -C vim fsautocomplete',
"           \   'unix':  'make -C vim fsautocomplete',
"           \ },
"           \ 'build_commands': ['make', 'mozroots', 'xbuild'],
"           \}
" NeoBundle "OrangeT/vim-csharp"
" NeoBundle "nosami/Omnisharp"

" Other languages
NeoBundle "pangloss/vim-javascript"
NeoBundle "briancollins/vim-jst"
NeoBundle "othree/javascript-libraries-syntax.vim"

" Html, Xml, Css, Markdown...
NeoBundle "groenewege/vim-less.git"
NeoBundle "kchmck/vim-coffee-script"
NeoBundle "slim-template/vim-slim.git"
NeoBundle "tpope/vim-haml"
NeoBundle "tpope/vim-markdown"
NeoBundle "jtratner/vim-flavored-markdown"
NeoBundle "suan/vim-instant-markdown"

" Git related...
NeoBundle "gregsexton/gitv"
NeoBundle "tpope/vim-fugitive"
NeoBundle "tpope/vim-git"
"NeoBundle "airblade/vim-gitgutter"

" General text editing improvements...
NeoBundle "briandoll/change-inside-surroundings.vim.git"
NeoBundle "godlygeek/tabular"
"NeoBundle "skwp/vim-easymotion"

" File Navigation / Project Management
" NeoBundle "kien/ctrlp.vim"
NeoBundle "tpope/vim-vinegar"

" Search
NeoBundle "rking/ag.vim"

" General vim improvements
NeoBundle "tpope/vim-dispatch"
" NeoBundle "majutsushi/tagbar.git"
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
" Colorschemes
NeoBundle "altercation/vim-colors-solarized"
NeoBundle "vivkin/flatland.vim"
NeoBundle "w0ng/vim-hybrid"
" NeoBundle "endel/vim-github-colorscheme"
" NeoBundle "croaky/vim-colors-github"
NeoBundle "sjl/badwolf"
" NeoBundle "nanotech/jellybeans.vim"
" NeoBundle "tomasr/molokai"
" NeoBundle "nielsmadan/harlequin"

" Cosmetics
NeoBundle "itchyny/lightline.vim"
NeoBundle "vim-scripts/TagHighlight.git"

" Tmux stuff
NeoBundle "christoomey/vim-tmux-navigator"

call neobundle#end()

"Filetype plugin indent on is required by neobundle
filetype plugin indent on

" Installation check
NeoBundleCheck
