" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" turn the title on for vim. Fancy!
set title

"turn on syntax highlighting
syntax on

let mapleader=","

" =============== NeoBundle Initialization ===============
" This loads all the plugins specified in ~/.vim/bundle.vim
" Use NeoBundle plugin to manage all other plugins
if filereadable(expand("~/.vim/bundles.vim"))
  source ~/.vim/bundles.vim
endif

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent    " always autoindent
set smartindent   " syntax indenting, kinda smart
set smarttab      " delete as tabs not spaces when expandtab is on
set shiftwidth=2  " use two spaces for a tab
set softtabstop=2
set tabstop=2
set expandtab     " use spaces instead of tabs

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       " Don't wrap lines
set linebreak    " Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   " fold based on indent
set foldnestmax=3       " deepest fold is 3 levels
set nofoldenable        " dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ " stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search Settings =======================

set incsearch       " Find the next match as we type the search
set hlsearch        " highlight search by default
set viminfo='100,f1 " Save upto 100 mark, enable capital marks
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type with capitals

" ========================================
" General vim sanity improvements
" ========================================
"
" alias yw to yank the entire word 'yank inner word'
" even if the cursor is halfway inside the word
" FIXME: will not properly repeat when you use a dot (tie into repeat.vim)
nnoremap <Leader>yw yiww

" ,ow = 'overwrite word', replace a word with what's in the yank buffer
" FIXME: will not properly repeat when you use a dot (tie into repeat.vim)
nnoremap <Leader>ow "_diwhp

"make Y consistent with C and D
nnoremap Y y$
function! YRRunAfterMaps()
  nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction

" Remap 0 and ^ because its better to get to the beggining of the text than
" the line.
nnoremap 0 ^
nnoremap ^ 0

" ========================================
" RSI Prevention - keyboard remaps
" ========================================
" Hitting <ESC> sucks...
" This works in insert and command mode
noremap! jk <ESC>
" noremap! kj <ESC>

" Now using the middle finger of either hand you can type
" underscores with apple-k or apple-d, and add Shift
" to type dashes
imap <silent> <Leader>k _
imap <silent> <Leader>d _
imap <silent> <Leader>K -
imap <silent> <Leader>D -

" <Leader># Surround a word with #{ruby interpolation}
map <Leader># ysiw#
vmap <Leader># c#{<C-R>"}<ESC>

" <Leader>" Surround a word with "quotes"
map <Leader>" ysiw"
vmap <Leader>" c"<C-R>""<ESC>

" <Leader>' Surround a word with 'single quotes'
map <Leader>' ysiw'
vmap <Leader>' c'<C-R>"'<ESC>

" <Leader>) or <Leader>( Surround a word with (parens)
" The difference is in whether a space is put in
map <Leader>( ysiw(
map <Leader>) ysiw)
vmap <Leader>( c( <C-R>" )<ESC>
vmap <Leader>) c(<C-R>")<ESC>

" <Leader>[ Surround a word with [brackets]
map <Leader>] ysiw]
map <Leader>[ ysiw[
vmap <Leader>[ c[ <C-R>" ]<ESC>
vmap <Leader>] c[<C-R>"]<ESC>

" <Leader>{ Surround a word with {braces}
map <Leader>} ysiw}
map <Leader>{ ysiw{
vmap <Leader>} c{ <C-R>" }<ESC>
vmap <Leader>{ c{<C-R>"}<ESC>

map <Leader>` ysiw`


"Go to last edit location with <Leader>.
nnoremap <Leader>. '.

"When typing a string, your quotes auto complete. Move past the quote
"while still in insert mode by hitting Ctrl-a. Example:
"
" type 'foo<c-a>
"
" the first quote will autoclose so you'll get 'foo' and hitting <c-a> will
" put the cursor right after the quote
imap <C-a> <esc>wa

" <Leader>q to toggle quickfix window (where you have stuff like GitGrep)
" <Leader>oq to open it back up (rare)
nmap <silent> <Leader>qc :cclose<CR>
nmap <silent> <Leader>qo :copen<CR>

" move up/down quickly by using Cmd-j, Cmd-k
" which will move us around by functions
nnoremap <silent> <D-j> }
nnoremap <silent> <D-k> {
autocmd FileType ruby map <buffer> <D-j> ]m
autocmd FileType ruby map <buffer> <D-k> [m
autocmd FileType rspec map <buffer> <D-j> }
autocmd FileType rspec map <buffer> <D-k> {
autocmd FileType javascript map <buffer> <D-k> }
autocmd FileType javascript map <buffer> <D-j> {


"GitGrep - open up a git grep line, with a quote started for the search
nnoremap <Leader>gg :GitGrep ""<left>
"GitGrep Current Partial
nnoremap <Leader>gcp :GitGrepCurrentPartial<CR>
"GitGrep Current File
nnoremap <Leader>gcf :call GitGrep(expand("%:t:r"))<CR>

"Move back and forth through previous and next buffers
"with <Leader>z and <Leader>x
nnoremap <silent> <Leader>z :bp<CR>
nnoremap <silent> <Leader>x :bn<CR>

" ==============================
" Window/Tab/Split Manipulation
" ==============================
" Move between split windows by using the four directions C-[h,j,k,l]
" This is now handled via the vim-tmux-navigator.  The same commands apply in
" tmux.

" Make gf (go to file) create the file, if not existent
nnoremap gf :e<cfile><CR>
nnoremap <C-w>f :sp +e<cfile><CR>
nnoremap <C-w>gf :tabe<cfile><CR>

" Zoom in and out of current window with <Leader>gz
map <silent> <Leader>gz <C-w>o

" Use numbers to pick the tab you want (like iTerm)
map <silent> <Leader>1 :tabn 1<cr>
map <silent> <Leader>2 :tabn 2<cr>
map <silent> <Leader>3 :tabn 3<cr>
map <silent> <Leader>4 :tabn 4<cr>
map <silent> <Leader>5 :tabn 5<cr>
map <silent> <Leader>6 :tabn 6<cr>
map <silent> <Leader>7 :tabn 7<cr>
map <silent> <Leader>8 :tabn 8<cr>
map <silent> <Leader>9 :tabn 9<cr>

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Resize windows with arrow keys
nnoremap <D-Up> <C-w>+
nnoremap <D-Down> <C-w>-
nnoremap <D-Left> <C-w><
nnoremap <D-Right>  <C-w>>

" create <%= foo %> erb tags using Ctrl-k in edit mode
imap <silent> <C-N> <%=  %><Esc>3hi

" create <%= foo %> erb tags using Ctrl-j in edit mode
imap <silent> <C-M> <%  %><Esc>2hi

" create -> and <- easier
imap <C-l> <space>=><space>
imap <C-J> <Space><-<Space>
imap <C-K> <Space>-><Space>

" ============================
" Shortcuts for everyday tasks
" ============================

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> <Leader>cf :let @* = expand("%:~")<CR>
nnoremap <silent> <Leader>cn :let @* = expand("%:t")<CR>

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

"(v)im (c)ommand - execute current line as a vim command
nmap <silent> <Leader>vc yy:<C-f>p<C-c><CR>

"(v)im (r)eload
nmap <silent> <Leader>vr :so %<CR>

" Type <Leader>hl to toggle highlighting on/off, and show current value.
noremap <Leader>hl :set hlsearch! hlsearch?<CR>

" These are very similar keys. Typing 'a will jump to the line in the current
" file marked with ma. However, `a will jump to the line and column marked
" with ma.  It’s more useful in any case I can imagine, but it’s located way
" off in the corner of the keyboard. The best way to handle this is just to
" swap them: http://items.sjbach.com/319/configuring-vim-right
nnoremap ' `
nnoremap ` '

" Use gg=G to format your xml!!!!
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" ================ Custom Settings ========================
" This will load plugin based settings
so ~/.vim/settings.vim
