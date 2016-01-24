" This file modifies vim's basic editing environment: the way it handles
" buffers, loads new files, etc.

" store viminfo within .vim/
if &viminfo !~ ',n'
  let &viminfo .= ',n'.fnamemodify(expand("$MYVIMRC"),":p:h").'/viminfo'
endif

filetype plugin indent on    " Enable filetype detection, then
                             " autoload corresponding plugins and
                             " indent.vim file

set hidden                   " Keep buffers alive when abandoned

set encoding=utf-8           " Set Unicode
set fileformats=unix,dos,mac " Order of preferred file formats

" %% = working directory of current buffer
cabbr <expr> %% expand('%:p:h')

" Force .md file extension to Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
