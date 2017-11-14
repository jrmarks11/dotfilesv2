augroup MyFormatting
  autocmd!
  " Remove extra newlines and trailng whitspace when saving
  au BufWritePre * : %s/\n\n\n\+//e | %s/\s\+$//e
augroup END

augroup RestoreCursorPositionGroup
  autocmd!
  " Save window position when leaving buffers
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
augroup END

augroup FiletypeGroup
  autocmd!
  " .org is an Org mode file
  au BufNewFile,BufRead *.org set filetype=org
augroup END
