" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Unite
" Plug 'Shougo/unite.vim'
" Plug 'Shougo/unite-outline'
" Plug 'Shougo/neomru.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Ruby, Rails, Rake...
" Plug 'ecomba/vim-ruby-refactoring'
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-rake'
" Plug 'tpope/vim-bundler'
" Plug 'vim-ruby/vim-ruby'
" Plug 'Keithbsmiley/rspec.vim'
" Plug 'thoughtbot/vim-rspec'
" Plug 'slim-template/vim-slim'
" Plug 'tpope/vim-haml'

" Haskell
" Plug 'dag/vim2hs'
" Plug 'Twinside/vim-hoogle'
" Plug 'eagletmt/neco-ghc'
" Plug 'eagletmt/ghcmod-vim'
" Plug 'bitc/hdevtools'

" Rust
Plug 'rust-lang/rust.vim'

" Clojure
Plug 'kien/rainbow_parentheses.vim'
" Plug 'amdt/vim-niji'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-slamhound'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-leiningen'
Plug 'tpope/vim-classpath'

" MONO!?!
" Plug 'fsharp/fsharpbinding', {
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
" Plug 'OrangeT/vim-csharp'
" Plug 'nosami/Omnisharp'

" Other languages
Plug 'pangloss/vim-javascript'
Plug 'briancollins/vim-jst'
Plug 'othree/javascript-libraries-syntax.vim'

" Html, Xml, Css, Markdown...
Plug 'groenewege/vim-less'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'suan/vim-instant-markdown'

" Git related...
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
"Plug 'airblade/vim-gitgutter'

" General text editing improvements...
Plug 'briandoll/change-inside-surroundings.vim'
Plug 'godlygeek/tabular'
"Plug 'skwp/vim-easymotion'

" File Navigation / Project Management
" Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-vinegar'

" Search
Plug 'rking/ag.vim'

" General vim improvements
Plug 'tpope/vim-dispatch'
" Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'sjl/gundo.vim'
" Plug 'skwp/YankRing.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Keithbsmiley/investigate.vim'

" Text objects

" Cosmetics, color scheme, Powerline...
" Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'vivkin/flatland.vim'
Plug 'w0ng/vim-hybrid'
" Plug 'endel/vim-github-colorscheme'
" Plug 'croaky/vim-colors-github'
Plug 'sjl/badwolf'
" Plug 'nanotech/jellybeans.vim'
" Plug 'tomasr/molokai'
" Plug 'nielsmadan/harlequin'

" Cosmetics
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/TagHighlight'

" Tmux stuff
Plug 'christoomey/vim-tmux-navigator'

" Initialize plugin system.
call plug#end()
