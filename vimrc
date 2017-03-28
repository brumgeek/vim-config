if has('unix')
  let s:vim_home = '$HOME/.vim/config/'
elseif has('win32')
  let s:vim_home = '$HOMEPATH/vimfiles/config/'  " Should this be `$HOME`?
endif

for file in split(glob(s:vim_home.'**/*.vim'), '\n')
exec 'source '.file
endfor
