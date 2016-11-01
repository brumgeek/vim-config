" ************
" * VIM-PLUG *
" ************

call plug#begin()

Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gioele/vim-autoswap'
Plug 'jaxbot/browserlink.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'kana/vim-textobj-user' | Plug 'reedes/vim-textobj-quote'
Plug 'rakr/vim-two-firewatch'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'

call plug#end()

" ***************
" * BROWSERLINK *
" ***************

let g:bl_pagefiletypes = ['css', 'scss', 'sass', 'html', 'javascript', 'php', 'slim']

" *************
" * LIMELIGHT *
" *************

" Set deeper default shading
let g:limelight_default_coefficient = 0.7

" *********************
" * VIM-TEXTOBJ-QUOTE *
" *********************

augroup textobj_quote
  autocmd!
  autocmd FileType markdown call textobj#quote#init()
  autocmd FileType text call textobj#quote#init()
augroup END

