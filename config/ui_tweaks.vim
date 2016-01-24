" This file contains adjustments to visual elements of the vim interface.

syntax on                   " Enable syntax highlighting
if system("uname") == "Linux"
  colorscheme spacegray
else
  colorscheme solarized       " and custom color scheme
endif
set number                  " Show line numbers
set hlsearch                " Highlight search matches

" Softwrap settings: break at word-boundaries and indent with line 1
set linebreak
set breakindent

" Set line numbering to relative
set relativenumber

" iTerm2 settings
if $TERM_PROGRAM =~ "iTerm"
  " Enable the appropriate cursor shape (vert. line) in insert mode 
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
  
  " Italicize comments
  highlight Comment cterm=italic
endif

" Folding
" set foldenable
" set foldcolumn=4
" set foldlevelstart=5
" set foldmethod=indent
" set foldnestmax=10

