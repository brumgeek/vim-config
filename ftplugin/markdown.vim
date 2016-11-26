" Activate Goyo & Limelight
nnoremap <buffer> <Leader>f :Goyo<CR>

function! ToHeader(level)
    normal m`
    if getline(line('.') + 1) =~ '=\{3,}'      " Cursor on H1 text?
        if a:level == 1
            return 0
        elseif a:level == 2
            normal jVr-
        elseif a:level == 3
            normal jdd-I### 
        endif
    elseif getline('.') =~ '=\{3,}'            " Cursor on H1 marker?
        if a:level == 1
            return 0
        elseif a:level == 2
            normal Vr-
        elseif a:level == 3
            normal dd-I### 
        endif
    elseif getline(line('.') + 1) =~ '-\{3,}'  " Cursor on H2 text?
        if a:level == 1
            normal jVr=
        elseif a:level == 2
            return 0
        elseif a:level == 3
            normal jdd-I### 
        endif
    elseif getline('.') =~ '-\{3,}'            " Cursor on H2 marker?
        if a:level == 1
            normal Vr=
        elseif a:level == 2
            return 0
        elseif a:level == 3
            normal dd-I### 
        endif
    elseif getline('.') =~ '^#\{3,6}'          " Cursor on H3-H6?
        if a:level == 1
            s/^#\+ //
            normal yypVr=
        elseif a:level == 2
            s/^#\+ //
            normal yypVr-
        elseif a:level == 3
            s/^#\+/###/
        endif
        if strlen(getline('.')) < 3
            if a:level == 1
                normal i=
            elseif a:level == 2
                normal i-
            endif
        endif
    elseif (getline(line('.') - 1) !~ '^\w*$'
                 \ || getline('.') =~ '^\w*$') " This line blank / Prev line not?
        return 0
    elseif getline('.') !~ '^\w*$'             " This line not blank?
        if a:level == 1
            normal yypVr=
        elseif a:level == 2
            normal yypVr-
        elseif a:level == 3
            normal I### 
        endif
    " else                                       " This line is blank?
    "     if getline(line('.') - 1) !~ '^\w*$'   " Prev line is blank?
    "         normal O
    "     endif
    "     if a:level == 1
    "         normal o===j
    "     elseif a:level == 2
    "         normal o---j
    "     elseif a:level == 3
    "         normal I### 
    "     endif
    endif

    if getline(line('.') + 1) !~ '^\w*$'       " Next line is blank?
        normal o
    endif

    nohlsearch
    silent! normal ``
endfunction

nnoremap <silent> <buffer> <Leader>h1 :call ToHeader(1)<CR>
nnoremap <silent> <buffer> <Leader>h2 :call ToHeader(2)<CR>
nnoremap <silent> <buffer> <Leader>h3 :call ToHeader(3)<CR>

