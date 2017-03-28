" This file modifies vim's basic editing environment: 
" how it loads buffers, loads new files, handles file metadata, etc.

" ***************************
" * ENVIRONMENT PERSISTENCE *
" ***************************

if &viminfo !~# ',n'               " Store viminfo within .vim/
  let &viminfo .= ',n'.fnamemodify(expand('$MYVIMRC'),':p:h').'/viminfo'
endif

if has('persistent_undo')         " Store vimundo within .vim/
    set undolevels=5000
    let &undodir = fnamemodify(expand('$MYVIMRC'),':p:h').'/vimundo'
    set undofile
endif

" ********************
" * FILE PERSISTENCE *
" ********************

set nobackup                      " Disable auto-backup when overwriting files
set hidden                        " Keep buffers alive when abandoned
set directory^=$HOME/.vim/swap/   " Store all swap files together

" Force backups to be copied from original, not renamed
set backupcopy=yes

" *********************
" * FILE MANIPULATION *
" *********************

function! MoveFile(dest, bang)
   let l:source = expand('%:p')
   let l:source_path = fnamemodify(l:source, ':h')
   let l:target = fnamemodify(a:dest, ':p')
   let l:target_path = fnamemodify(l:target, ':h')
   let l:status = 1

   if bufexists(l:target)
     if (a:bang ==# '!')
       exec 'bwipe!' . bufnr(l:target)
     else
       echoerr 'File is loaded in another buffer (add ! to override)'
       return 0
     endif
   endif

   if !isdirectory(l:target_path)
     if (a:bang ==# '!')
       exec '!mkdir -p ' . l:target_path
     else
       echoerr l:target_path . ': No such directory'
       return 0
     endif
   endif

   if (isdirectory(l:target))
     exe 'saveas' . a:bang . fnameescape(l:target) . expand('%:t')
     let l:status = 0
   else
     exe 'saveas' . a:bang . fnameescape(l:target)
     let l:status = 0
   endif

   call delete(l:source)
   exec 'bwipe!' . bufnr(l:source)

   return l:status
endfunction

command! -nargs=1 -complete=file -bar -bang Mv call MoveFile('<args>', '<bang>')

" *****************
" * FILE METADATA *
" *****************

filetype plugin indent on         " Enable filetype detection for automatic
                                  " plugins and indentation

set encoding=utf-8                " Set Unicode
set fileformats=unix,dos,mac      " Order of preferred file formats

" **********************
" * INTERFACE BEHAVIOR *
" **********************

set splitbelow                    " Open new windows below...
set splitright                    "   ...or to the right of the current buffer.

set linebreak                     " Wrap at word boundaries (and not textwidth)
set breakindent                   " Indent whole paragraph, not just first line

" ************************
" * COMMAND LINE OPTIONS *
" ************************

set ignorecase                    " Search with
set smartcase                     " smart case recognition

set wildignore+=*/tmp/*,*.zip,*.swp,*.so

" %% = working directory of current buffer
cabbr <expr> %% fnameescape(expand('%:p:h'))

" ***********
" * FOLDING *
" ***********

" set foldenable
" set foldcolumn=4
" set foldlevelstart=5
" set foldmethod=indent
" set foldnestmax=10
