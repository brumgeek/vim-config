" Activate Goyo & Limelight
nnoremap <buffer> <Leader>f :Goyo<CR>

function! ToHeader(level)
    let l:prevline = getline(line('.') - 1)
    let l:thisline = getline('.')
    let l:nextline = getline(line('.') + 1)
    if a:level == 1
        let l:hmarker = '='
    elseif a:level == 2
        let l:hmarker = '-'
    endif

    normal m`

    if (l:prevline !~ '^\s*$' ||
      \ l:thisline =~ '^\s*$')
        return 0
    elseif l:thisline.l:nextline =~ '[=-]\{3,}' " Cursor on H1-H2?
        if l:nextline =~ '[=-]\{3,}' 
            normal j 
        endif
        if a:level < 3
            exec 'normal Vr' . l:hmarker
        elseif a:level == 3
            normal dd-I### 
        endif
    elseif l:thisline =~ '^#\{3,6} \w'          " Cursor on H3-H6?
        if a:level < 3
            s/^#\+ //
            let l:linelen = max([3, strlen(getline('.'))])
            exec 'normal o' . repeat(l:hmarker, l:linelen)
        elseif a:level == 3
            s/^#\+/###/
        endif
        nohlsearch
    elseif (l:thisline =~ '^\w*$' && 
          \ strlen(l:thisline) < 50)            " Cursor on regular text?
        if a:level < 3
            exec 'normal yypVr' . l:hmarker
        elseif a:level == 3
            normal I### 
        endif
    endif

    if l:nextline !~ '^\s*$'                    " Force empty line below header
        normal o
    endif

    normal ``
endfunction

nnoremap <silent> <buffer> <Leader>h1 :call ToHeader(1)<CR>
nnoremap <silent> <buffer> <Leader>h2 :call ToHeader(2)<CR>
nnoremap <silent> <buffer> <Leader>h3 :call ToHeader(3)<CR>

