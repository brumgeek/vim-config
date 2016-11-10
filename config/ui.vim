" This file contains adjustments to visual elements of the vim interface.

syntax on                   " Enable syntax highlighting...
colorscheme solarized       "   ...and custom color scheme...
set background=dark         "   ...and light/dark variation.
set number                  " Show line numbers...
set relativenumber          "   ...relative to current line.
set hlsearch                " Highlight search matches

" iTerm2 settings
if $TERM_PROGRAM =~ "iTerm"
  " Enable the appropriate cursor shape in insert mode 
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
  " Enable 256 color mode
  set t_Co=256
  
  " Italicize comments
  highlight Comment cterm=italic
endif
