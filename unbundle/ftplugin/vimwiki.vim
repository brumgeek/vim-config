" In Normal Mode, map <C-h> to same as <Backspace> (<Plug>VimwikiGoBackLink)
nmap <C-h> <Backspace>

" Remap commands whose default mappings don't work in iTerm (due to lack of
" support for modifiers on non-printing characters, like <S-CR>)
" :nmap <Leader>wf <Plug>VimwikiFollowLink
:nmap <Leader>we <CR>
:nmap <Leader>wq <Plug>VimwikiVSplitLink
:nmap <Leader>wt <Plug>VimwikiTabnewLink
