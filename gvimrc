" GUI VIM CONFIGURATION

set guioptions=                           " Disable GUI chrome 
colorscheme solarized
set bg=light
set lines=999 columns=85

if hostname() =~# 'sardanapalus'
  set guifont=Source\ Code\ Pro\ Light:h17
elseif hostname() =~# 'liberte'
  set guifont=Source\ Code\ Pro:h17
else
  set guifont=Source\ Code\ Pro\ Light:h18
endif

if has('win32')
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
