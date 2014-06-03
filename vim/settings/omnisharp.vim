let g:Omnisharp_timeout = 10

set splitbelow " Show help at the bottom, not the top.

nnoremap gd :OmniSharpGotoDefinition<CR>
nnoremap <Leader>fi :OmniSharpFindImplementation<CR>
nnoremap <Leader>ft :OmniSharpFindType<CR>
nnoremap <Leader>fs :OmniSharpFindSymbol<CR>
nnoremap <Leader>fu :OmniSharpFindUsages<CR>
nnoremap <Leader>fm :OmniSharpFindMembersInBuffer<CR>
nnoremap <Leader>x :OmniSharpFixIssue<CR>
nnoremap <Leader>tt :OmniSharpTypeLookup<CR>
nnoremap <Leader>dc :OmniSharpDocumentation<CR>
