"" This file contains custom keybindings

" Set leader & other variables
let mapleader = "\<Space>"
let maplocalleader = "\\"
set wildcharm=<C-z>

" $MYVIMRC source/edit
if has('unix')
  nnoremap <Leader>ev :e $HOME/.vim/config/
elseif has('win32')
  nnoremap <Leader>ev :e $HOMEPATH\vimfiles\config\
endif

if has('gui_running')
  nnoremap <Leader>sv :source $MYVIMRC \| source $MYGVIMRC<CR>
else
  nnoremap <Leader>sv :source $MYVIMRC<CR>
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
nnoremap <Leader>p "*p
nnoremap <Leader>P "*P
nnoremap <Leader>y "*y
nnoremap <Leader>Y "*y$
nnoremap <Leader>d "*d
nnoremap <Leader>D "*D
 if has('mac')
   inoremap <D-v> <C-o>"*p
 elseif has('win32')
   inoremap <C-v> <C-o>"*p
 endif
vnoremap <Leader>p "*p
vnoremap <Leader>P "*P
vnoremap <Leader>y "*y
vnoremap <Leader>Y "*y$
vnoremap <Leader>d "*d
vnoremap <Leader>D "*D

" Easy whitespace
nnoremap <Leader>k m`O<Esc>``
nnoremap <Leader>j m`o<Esc>``
nnoremap <Leader>h i <Esc>l
nnoremap <Leader>l a <Esc>h
nnoremap <Leader><CR> i<CR><Esc>`.

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
nnoremap <Leader>W :wa<CR>

" UI & WINDOW MANAGEMENT
" Enable full-screen on Windows
if has('win32')
  map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif

" " One-press window switching
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W

" FILE MANAGEMENT
nnoremap <Leader>en :e ~/Documents/Notes/**/
nnoremap <Leader>eb :e ~/Projects/rlue.github.io/_drafts/**

" NAVIGATION
" in Command Mode, from http://stackoverflow.com/a/6923282/4865822
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
cnoremap <C-d> <Del>

" Smart j/k (move by display lines unless a count is provided)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Find cursor
nnoremap <silent> <Leader><Space> :call FlashLine()<CR>
function! FlashLine()
  for i in [30, 50, 30, 250]
    set cursorline!
    exec 'sleep ' . i . 'm'
    redraw
  endfor
endfunction

" MISCELLANEOUS

" Enable linewise repeat commands (via `.`) in Visual Mode
" (via http://vim.wikia.com/wiki/Repeat_command_on_each_line_in_visual_block)
vnoremap . :normal .<CR>

" Disable Ex mode (per http://www.bestofvim.com/tip/leave-ex-mode-good/)
nnoremap Q <Nop>

" Switch from Search to Replace super fast!
" nmap <expr> M ':%s/' . @/ . '//g<LEFT><LEFT>'
