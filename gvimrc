" GUI VIM CONFIGURATION

set guioptions=                           " Disable GUI chrome 
colorscheme two-firewatch | let g:two_firewatch_italics=1
set bg=light
set lines=999 columns=85

if hostname() =~ "sardanapalus"
  set guifont=Source\ Code\ Pro\ Light:h19
elseif hostname() =~ "liberte"
  set guifont=Source\ Code\ Pro:h20
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
