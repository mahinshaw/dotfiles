" Settings for the gui

" remove the scrollbar
set guioptions-=r
set guioptions-=L

" For macvim
if has("gui_macvim")
  :macm Window.Toggle\ Full\ Screen\ Mode key=<D-Enter>
endif


