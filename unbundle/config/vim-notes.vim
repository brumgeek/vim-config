" Set keybindings for common commands 

nnoremap <Leader>n :Note 

" Set default working directory
if $COMPUTERNAME == "WEI-PC"
  let g:notes_directories = ['~/Dropbox/Work/Notes', '~/Dropbox/Notes/']
else
  let g:notes_directories = ['~/Dropbox/Notes/', '~/Dropbox/Work/Notes']
endif

let g:notes_suffix='.txt' " Set .txt file extension on all notes

" let g:notes_title_sync='change_title' " On title/filename conflicts, follow filename 

let g:notes_conceal_url = 0

