" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip the trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Save the last search and cursor position
  let _s=@
  let l = line(".")
  let c = col(".")
  " Clear the trailing whitespace
  %s/\s\+$//e
  " restore search and cursor
  let @/=_s
  call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
nmap ,w :StripTrailingWhitespaces<CR>
