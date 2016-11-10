" " :make settings
" compiler ruby
" setlocal makeprg=ruby\ -wc\ %

" Easy execute and test mappings
nnoremap <Leader>x :w <bar> !jsc %<CR>

