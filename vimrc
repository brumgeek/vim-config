if has('unix')
  let s:vim_home = '$HOME/.vim/config/'
elseif has('win32')
  let s:vim_home = '$HOME/vimfiles/config/'
endif

let config_list = [
  \ 'mappings.vim',
  \ 'plugins/*.vim',
  \ 'workflow.vim',
  \ 'ui_tweaks.vim',
  \ 'misc.vim',
  \ 'machine_specific.vim'
\]

for files in config_list
  for f in split(glob(s:vim_home.files), '\n')
    exec 'source '.f
  endfor
endfor
