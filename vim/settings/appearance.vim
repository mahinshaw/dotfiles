" Use solarized colorscheme and powerline fonts
" http://ethanschooner.com/solarized/vim-colors-solarized
colorscheme hybrid
set background=dark

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
