" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'briancollins/vim-jst'
Plug 'othree/javascript-libraries-syntax.vim'

" Html, Xml, Css, Markdown...
Plug 'groenewege/vim-less'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'suan/vim-instant-markdown'

" File Navigation / Project Management
" Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-vinegar'

" Search
Plug 'rking/ag.vim'

" General vim improvements
" Plug 'tpope/vim-dispatch'
" Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
" Plug 'sjl/gundo.vim'
" Plug 'skwp/YankRing.vim'
" Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-eunuch'
" Plug 'tpope/vim-ragtag'
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-unimpaired'
" Plug 'Keithbsmiley/investigate.vim'

" Tmux stuff
Plug 'christoomey/vim-tmux-navigator'

" Initialize plugin system.
call plug#end()
