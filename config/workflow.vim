" This file modifies vim's basic editing environment: the way it handles
" buffers, loads new files, etc.

set nobackup
set nowritebackup
set noswapfile

" store viminfo within .vim/
if &viminfo !~ ',n'
  let &viminfo .= ',n'.fnamemodify(expand("$MYVIMRC"),":p:h").'/viminfo'
endif

if has('persistent_undo')
    set undolevels=5000
    " let vimundo=fnamemodify(expand("$MYVIMRC"),":p:h").'/vimundo'
    let &undodir = fnamemodify(expand("$MYVIMRC"),":p:h").'/vimundo'
    set undofile
endif

filetype plugin indent on    " Enable filetype detection, then
                             " autoload corresponding plugins and
                             " indent.vim file

set hidden                   " Keep buffers alive when abandoned

set encoding=utf-8           " Set Unicode
set fileformats=unix,dos,mac " Order of preferred file formats

" %% = working directory of current buffer
cabbr <expr> %% expand('%:p:h:gs?\ ?\\\ ?')

" Force .md file extension to Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

