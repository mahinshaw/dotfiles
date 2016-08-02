" Use hybrid colorscheme and powerline fonts
" https://github.com/w0ng/vim-hybrid
" if has("mac")
"   let g:hybrid_use_iTerm_colors = 1
" elseif has("linux")
"   let g:hybrid_use_Xresources = 1
" endif
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
set background=dark
colorscheme hybrid

if has("gui_running")
  " colorscheme flatland
  "tell the term we have 256 colors
  set t_Co=256

  " Show the tab number on VimEnter
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M

  " set lines=60
  " set columns=190

  if has("gui_gtk2")
    set guifont=Inconsolata\ XL\ 12,Inconsolata\ 15,Monaco\ 12
  else
    set guifont=Inconsolata\ XL:h14,Inconsolata:h17,Monaco:h14
  end
else
  " dont load csapprox if we no gui support - silence annoying warning
  let g:CSApprox_loaded = 1
endif
