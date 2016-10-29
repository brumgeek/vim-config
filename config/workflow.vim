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

" Exclude directories from wildcard expansion on Mac
if system("uname -s") =~ "Darwin"
  set wildignore+=*tmp/*,*Applications/*,*Library/*,*Music/*,*Movies/*,*Pictures/*,*.zip 
endif

" %% = working directory of current buffer
cabbr <expr> %% expand('%:p:h:gs?\ ?\\\ ?')

set splitbelow
set splitright

" Force .md file extension to Markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" " Set Liquid filetype within Jekyll directories
" function! LiquidInJekyll()
"   if !empty(glob("_config.yml"))
"     if match(strpart(@%, 0, 1), '\h') != -1
"       set filetype=liquid
"     endif
"  endif
" endfunction

" autocmd BufNewFile,BufRead *.html call LiquidInJekyll()
" autocmd BufNewFile,BufRead *.xml  call LiquidInJekyll()
" autocmd BufNewFile,BufRead *.css  call LiquidInJekyll()
" autocmd BufNewFile,BufRead *.js   call LiquidInJekyll()

