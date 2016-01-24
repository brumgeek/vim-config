" This file contains custom keybindings

" Set leader & other variables
let mapleader = "\<Space>"
let maplocalleader = "\\"
set wildcharm=<C-z>

" $MYVIMRC source/edit
if has('unix')
  nnoremap <Leader>ev :e $HOME/.vim/config/
  nnoremap <Leader>sv :source $MYVIMRC<CR>
elseif has('win32')
  nnoremap <Leader>ev :e $HOMEPATH\vimfiles\config\
  nnoremap <Leader>sv :source $MYVIMRC \| source $MYGVIMRC<CR>
endif

" TEXT MANIPULATION
" <C-h> = <Backspace>, so...
inoremap <C-l> <Del>

" and <C-w> deletes a word backward, so...
inoremap <C-e> <C-o>de

" Make Y behave like C and D, rather than do the same thing as 'yy'
nnoremap Y y$

" Make . work in Visual Mode
" vnoremap . :norm.<CR>

" Easy yank-put from system clipboard
nnoremap <Leader>y "*y
nnoremap <Leader>Y "*y$
nnoremap <Leader>p "*p
nnoremap <Leader>P "*P
 if has('mac')
   inoremap <D-v> <C-o>"*p
 elseif has('win32')
   inoremap <C-v> <C-o>"*p
 endif
vnoremap <Leader>y "*y
vnoremap <Leader>Y "*y$
vnoremap <Leader>p "*p
vnoremap <Leader>P "*P

" Easy whitespace
nnoremap <Leader>k m`O<Esc>``
nnoremap <Leader>j m`o<Esc>``
nnoremap <Leader>h i <Esc>l
nnoremap <Leader>l a <Esc>h
nnoremap <Leader><CR> i<CR><Esc><Backspace>

" More text objects! 
for char in [ '_', '-', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '%', '`' ]
    execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
    execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
    execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
    execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor

" BUFFER MANAGEMENT
" Save
nnoremap <Leader>w :update<CR>
vnoremap <Leader>w <C-c>:update<CR>gv

" Switching Buffers
" nnoremap <Leader>b :buffer <C-z><S-Tab>
nnoremap <Leader>b :ls<CR>:b

" WINDOW MANAGEMENT
" Set width for Split Screen in El Capitan
nnoremap <Leader>ss :set columns=95<CR>:sleep 15m<CR><C-L>

" One-press window switching
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W

" UI
nnoremap <Leader>zi :set guifont=Consolas:h24<CR>

" NAVIGATION
" Up/down keys navigate screen lines, rather than file lines
nnoremap <Down> gj
nnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
xnoremap <Down> gj
xnoremap <Up> gk

" Left/right keys jump line breaks
nnoremap <Left> <Backspace>
nnoremap <Right> <Space>
inoremap <Left> <C-o><Backspace>
inoremap <Right> <C-o><Space>
xnoremap <Left> <Backspace>
xnoremap <Right> <Space>

