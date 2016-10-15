" Easy execute and test mappings
nnoremap <Leader>x :w <bar> !ruby %<CR>
nnoremap <Leader>R :w <bar> !rspec<CR>
nnoremap <Leader>r :w <bar> !rspec %<CR>

" Set default directories for :find
setlocal path+=lib/**,spec/**

