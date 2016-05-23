" GUI VIM CONFIGURATION

set lines=999 columns=85
set guifont=Source\ Code\ Pro\ Light:h18

if hostname() =~ "sardanapalus"
  set guifont=Source\ Code\ Pro\ Light:h19
  " set guifont=PragmataPro:h17
endif

if has('win32')
  " Disable GUI chrome 
  set guioptions=
  
  " Fix garbled graphical menu text on Chinese (TW) Windows systems
  " if $COMPUTERNAME == "WEI-PC"
  "   so $VIMRUNTIME/delmenu.vim
  "   so $VIMRUNTIME/menu.vim
  "   language messages zh_TW.utf-8
  " endif

  " Remap <M-Space> to Windows system menu, add <C-n> shortcut to minimize
  :map <M-Space> :simalt ~<CR>
  :map <C-n> :simalt ~n<CR>
endif
