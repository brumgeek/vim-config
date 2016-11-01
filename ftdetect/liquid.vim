au BufNewFile,BufRead *.css, *.js
\ if getline(1) == '---' | set ft=liquid | endif
