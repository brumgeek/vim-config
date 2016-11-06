if has('unix')
  let s:vim_home = '$HOME/.vim/config/'
elseif has('win32')
  let s:vim_home = '$HOME/vimfiles/config/'  " Should this be `$HOMEPATH`?
endif

for file in split(glob(s:vim_home.'**/*.vim'), '\n')
exec 'source '.file
endfor
