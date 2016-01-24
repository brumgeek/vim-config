" This file contains settings which have not yet been categorized

" Set smart case recognition for searches
set ignorecase
set smartcase

" Set machine-specific default working directory
" if has('win32')
"   if $COMPUTERNAME == "ODALISQUE"
"     :cd $HOMEPATH/Dropbox
"   endif
" elseif has('unix')
"   if hostname() =~ "liberte"
"     :cd $HOME/Dropbox/
"   elseif hostname() =~ "sardanapalus"
"     :cd $HOME/Dropbox/Work
"   endif
" else
"     :cd $HOME/
" endif
if has('win32')
  :cd $HOMEPATH/Dropbox
elseif has('unix')
  :cd $HOME/Dropbox/
else
  :cd $HOME/
endif

