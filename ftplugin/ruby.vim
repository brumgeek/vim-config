" :make settings
compiler ruby
setlocal makeprg=ruby\ -wc\ %

" Easy execute and test mappings
nnoremap <Leader>r :w <bar> !ruby %<CR>
nnoremap <Leader>m :make<CR>
nnoremap <Leader>T :w <bar> !rspec<CR>
nnoremap <Leader>t :w <bar> !rspec %<CR>

" " Set default directories for :find
" setlocal path+=lib/**,spec/**

