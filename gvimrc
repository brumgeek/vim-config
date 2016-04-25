" Set font
if has('gui_macvim')
  if hostname() =~ "sardanapalus"
    set guifont=Source\ Code\ Pro\ Light:h19
    " set guifont=PragmataPro:h17
  else
    set guifont=Source\ Code\ Pro\ Light:h18
  endif
elseif has('win32')
  set guifont=Source\ Code\ Pro\ Light:h18
endif

" Fix UTF-8 menu encoding problem on Windows systems localized to Chinese (Traditional)
" if $COMPUTERNAME == "WEI-PC"
"   so $VIMRUNTIME/delmenu.vim
"   so $VIMRUNTIME/menu.vim
"   language messages zh_TW.utf-8
" endif

" Disable GUI chrome 
set guioptions=

" Set window size
set lines=999 columns=85

" Set color scheme variant
set background=dark

" Remap <M-Space> to Windows system menu, add <C-n> shortcut to minimize
if has('win32')
  :map <M-Space> :simalt ~<CR>
  :map <C-n> :simalt ~n<CR>
endif
