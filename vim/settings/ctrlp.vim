" if executable('ag')
"   " Use ag since it is faster
"   let g:ctrlp_user_command = 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

"   " ag is fast, so dont cache
"   let g:ctrlp_use_caching = 0
" else
"   " Fall back to using git ls-files if Af is not available
"   let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
"   let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
" endif

" " Default filename searches - so that appctrl will find application controller
" let g:ctrlp_by_filename = 1

" " Don't jump to already open window.  This is annoying if you are maintaining
" " several Tab workspaces and want to open two windows into the same file.
" let g:ctrlp_switch_buffer = 0

" " We don't want to use Ctrl-P as the mapping because
" " it interferes with YankRing (paste, then hit ctrl-p)
" let g:ctrlp_map = '<Leader>p'
" nnoremap <silent> <Leader>p :CtrlP<CR>

" " Additional mapping for buffer searches
" nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
" nnoremap <silent> <C-b> :CtrlPBuffer<CR>

" " Idea from : http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
" " Open CtrlP starting from a particular path, making it much
" " more likely to find the correct thing first. mnemonic 'jump to [something]'
" map <Leader>ja :CtrlP app/assets<CR>
" map <Leader>jm :CtrlP app/models<CR>
" map <Leader>jc :CtrlP app/controllers<CR>
" map <Leader>jv :CtrlP app/views<CR>
" map <Leader>jh :CtrlP app/helpers<CR>
" map <Leader>jl :CtrlP lib<CR>
" map <Leader>jp :CtrlP public<CR>
" map <Leader>js :CtrlP spec<CR>
" map <Leader>jf :CtrlP fast_spec<CR>
" map <Leader>jd :CtrlP db<CR>
" map <Leader>jC :CtrlP config<CR>
" map <Leader>jV :CtrlP vendor<CR>
" map <Leader>jF :CtrlP factories<CR>
" map <Leader>jT :CtrlP test<CR>
