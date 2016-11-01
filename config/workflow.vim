" This file modifies vim's basic editing environment: 
" how it loads buffers, loads new files, handles file metadata, etc.

" ***************************
" * ENVIRONMENT PERSISTENCE *
" ***************************

if &viminfo !~ ',n'               " Store viminfo within .vim/
  let &viminfo .= ',n'.fnamemodify(expand("$MYVIMRC"),":p:h").'/viminfo'
endif

if has('persistent_undo')         " Store vimundo within .vim/
    set undolevels=5000
    let &undodir = fnamemodify(expand("$MYVIMRC"),":p:h").'/vimundo'
    set undofile
endif

" ********************
" * FILE PERSISTENCE *
" ********************

set nobackup                      " Disable auto-backup when overwriting files
set noswapfile                    " Disable autosave
set hidden                        " Keep buffers alive when abandoned

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

set wildignore+=*tmp/*,*.zip      " Basic exclusions from wildcard expansion
if system("uname -s") =~ "Darwin" " ...and default directories on a Mac
  set wildignore+=*Applications/*,*Library/*,*Music/*,*Movies/*,*Pictures/*
endif

" %% = working directory of current buffer
cabbr <expr> %% expand('%:p:h:gs?\ ?\\\ ?')

" ***********
" * FOLDING *
" ***********

" set foldenable
" set foldcolumn=4
" set foldlevelstart=5
" set foldmethod=indent
" set foldnestmax=10

