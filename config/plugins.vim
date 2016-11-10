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
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user' | Plug 'reedes/vim-textobj-quote'
Plug 'pangloss/vim-javascript'
Plug 'rakr/vim-two-firewatch'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'

call plug#end()

" ***************
" * BROWSERLINK *
" ***************

" Disable built-in event handling...
let g:bl_no_autoupdate = 1

" ...in lieu of custom event handler to force delay inside Jekyll directories.
let s:delay_interval = '1000m'
let s:bl_pagefileexts  = 
      \ [ 'html' , 'js'     , 'php'  ,
      \   'css'  , 'scss'   , 'sass' ,
      \   'slim' , 'liquid' , 'md'     ]

function! s:setupHandlers()
  let s:path_flag = '%:p:h' | let s:this_path = expand(s:path_flag)
  if !(s:this_path =~ '_site') 
    while s:this_path != $HOME 
      if !empty(globpath(s:this_path,'_config.yml')) 
        exec 'sleep ' . s:delay_interval | break 
      endif 
      let s:path_flag .= ':h' | let s:this_path = expand(s:path_flag) 
    endwhile 
  endif 
  :BLReloadPage 
  if expand('%:e:e') =~ 'css' 
    :BLReloadCSS 
  endif
endfunction

exec "autocmd BufWritePost " . '*.' . join(s:bl_pagefileexts,',*.') . " call s:setupHandlers()"

" *************
" * LIMELIGHT *
" *************

let g:limelight_default_coefficient = 0.7   " Set deeper default shading

autocmd! User GoyoEnter Limelight           " Tie Limelight to Goyo
autocmd! User GoyoLeave Limelight!

" ******************
" * VIM-EASY-ALIGN *
" ******************

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" *********************
" * VIM-TEXTOBJ-QUOTE *
" *********************

augroup textobj_quote
  autocmd!
  autocmd FileType markdown call textobj#quote#init()
  autocmd FileType text     call textobj#quote#init()
augroup END

" ****************
" * VIM-FUGITIVE *
" ****************

nnoremap <Leader>gm :Gmove<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gc :Gcommit -m ""<Left>
nnoremap <Leader>gp :Gpush<CR>

" *************
" * SYNTASTIC *
" *************

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

