" This file contains adjustments to visual elements of the vim interface.

syntax on                   " Enable syntax highlighting
colorscheme solarized       " and custom color scheme
set background=dark         " 
set number                  " Show line numbers
set relativenumber          " 
set hlsearch                " Highlight search matches

" Softwrap settings
set linebreak               " Break at word boundaries
set breakindent             " Indent whole paragraph, not just first line

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

" Folding
" set foldenable
" set foldcolumn=4
" set foldlevelstart=5
" set foldmethod=indent
" set foldnestmax=10

