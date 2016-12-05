" Activate Goyo & Limelight
nnoremap <buffer> <Leader>f :Goyo<CR>

function! EmptyLine(action, relativecount)
    if a:action !~ '\(add\|rm\)' || type(a:relativecount) != 0
        return 0
    endif

    let l:thisline = line('.')
    let l:prefix = a:relativecount > 0 ? '+' : ''
    if a:action == 'add' && strlen(getline(line('.') + a:relativecount)) != 0
        let l:newlinecmd = a:relativecount > 0 ? 'O' : 'o'
        let l:thisline += a:relativecount > 0 ? 0 : 1
        exec l:prefix . a:relativecount
        exec 'normal ' . l:newlinecmd
    elseif a:action == 'rm' && strlen(getline(line('.') + a:relativecount)) == 0
        let l:thisline -= a:relativecount > 0 ? 0 : 1
        exec l:prefix . a:relativecount
        exec 'normal dd'
    endif
    exec l:thisline
endfunction

function! ToHeader(level)
    let l:hmarker = a:level == 1 ? '=' : a:level == 2 ? '-' : '#'
    let l:context = getline(line('.') - 1, line('.') + 1)
    let l:thisline = line('.')

    if line('.') == 1
        call insert(l:context, '')
    elseif line('.') >= line('$') - 1
        return 0
    endif

    " Cursor on H1-H2
    if join(l:context, '') =~ '[^=-][=-]\{3,}'
        let l:prepos = l:context[2] =~ '[=-]\{3,}' ? '1j' : ''
        if a:level < 3
            exec 'normal ' . l:prepos . 'Vr' . l:hmarker
        else
            let l:thisline = l:context[1] =~ '[=-]\{3,}' ? l:thisline - 1 : l:thisline
            exec 'normal ' . l:prepos . 'dd-I' . repeat(l:hmarker, a:level) . ' '
        endif
    " Cursor on H3-H6
    elseif l:context[1] =~ '^#\{3,6}'
        if a:level < 3
            s/^#\+ //
            let l:linelen = max([3, strlen(getline('.'))])
            exec 'normal o' . repeat(l:hmarker, l:linelen)
        else
            exec 's/^#\+\s*/' . repeat(l:hmarker, a:level) . ' '
        endif
        nohlsearch
    " Cursor on regular text
    elseif join(l:context[0:1], '|') =~ '^|\w'
        if a:level < 3
            exec 'normal yypVr' . l:hmarker
        else
            exec 'normal I' . repeat(l:hmarker, a:level) . ' '
        endif
    else
        return 0
    endif

    if a:level < 3
        call EmptyLine('add', -2)
        call EmptyLine('add', +1)
    else
        call EmptyLine('add', -1)
        call EmptyLine('rm', +1)
    endif
    exec l:thisline
endfunction

nnoremap <silent> <buffer> <Leader>h1 :call ToHeader(1)<CR>
nnoremap <silent> <buffer> <Leader>h2 :call ToHeader(2)<CR>
nnoremap <silent> <buffer> <Leader>h3 :call ToHeader(3)<CR>

