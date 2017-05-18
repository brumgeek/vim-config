" This file contains adjustments to visual elements of the vim interface.

syntax on                   " Enable syntax highlighting...
set synmaxcol=200           "   ...but limit on very long lines.
if !has('gui_running')
  colorscheme solarized     " Set custom color scheme...
  set background=dark       "   ...and light/dark variation.
endif
set number                  " Show line numbers...
set relativenumber          "   ...relative to current line.
set hlsearch                " Highlight search matches

augroup colorcolumn
  autocmd!
  autocmd FileType ruby,sh,vim,css,scss,javascript
        \ let &l:colorcolumn=join(range(81,999),',')
augroup END

" iTerm2 settings
if $TERM_PROGRAM =~# 'iTerm'
  " Enable the appropriate cursor shape in insert mode 
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
  " Enable 256 color mode
  set t_Co=256
  
  " Italicize comments
  highlight Comment cterm=italic
endif

" **********************
" * INTERFACE BEHAVIOR *
" **********************

set splitbelow                    " Open new windows below...
set splitright                    "   ...or to the right of the current buffer.

set linebreak                     " Wrap at word boundaries (and not textwidth)
set breakindent                   " Indent whole paragraph, not just first line
