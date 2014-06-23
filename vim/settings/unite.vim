" /davidpdrsn/dotfiles/vimrc
" /terryma/dotfiles/.vimrc
" Initializations
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Make sure unite settings only happen in the unite window.
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  nmap <buffer> <ESC> <Plug>(unite_insert_enter)
  imap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> jk <Plug>(unite_insert_leave)
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
endfunction

" Custom ignore_pattern
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
  \ 'ignore_pattern', join([
  \ '\.git/',
  \ '\.hg/',
  \ '\.cache/',
  \ '\.activator/',
  \ '\google/obj/',
  \ '\tmp/',
  \ '\.sass-cache',
  \ '\node_modules/',
  \ '\bower_components/',
  \ '\dist/',
  \ '\.pyc',
  \ ], '\|'))

let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_source_rec_max_cache_files=5000
let g:unite_source_history_yank_enabled=1
let g:unite_source_grep_max_candidates=200
let g:unite_split_rule='botright'
let g:unite_winheight=10
" let g:unite_enable_start_insert=1

" Set the Prefix key
nnoremap [unite] <Nop>
nmap <Space> [unite]

" File Navigation
nnoremap [unite]f :<C-u>Unite -buffer-name=file -start-insert file<CR>
nnoremap [unite]r :<C-u>Unite -buffer-name=file -start-insert file_rec/async:!<CR>
nnoremap [unite]F :<C-u>Unite -buffer-name=file -start-insert buffer tab file_mru directory_mru<CR>
nnoremap [unite]m :<C-u>Unite -buffer-name=mru -start-insert file_mru<CR>
nnoremap [unite]e :<C-u>Unite -buffer-name=buffer -start-insert buffer<CR>

" Document Outline
nnoremap [unite]o :<C-u>Unite -buffer-name=outline -start-insert -auto-preview outline<CR>

" Yank related
nnoremap [unite]y :<C-u>Unite -buffer-name=yank history/yank<CR>

" GREP related
map [unite]g :<C-u>Unite -no-split grep:.<CR>
map [unite]t :<C-u>Unite -no-split grep:.:-s:\(TODO\|FIXME\)<CR>

if executable('ag')
  " Use ag in unite grep source
  let g:unite_source_grep_command = 'ag'
  " taken from ctrlp settings
  let g:unite_source_grep_default_opts = 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'
  let g:unite_source_grep_recursive_opt = ''
endif
