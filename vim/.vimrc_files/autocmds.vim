augroup MyFormatting
  au!
  " Remove extra newlines and trailng whitspace when saving
  au BufWritePre * : %s/\n\n\n\+//e | %s/\s\+$//e
augroup END

augroup RestoreCursorPositionGroup
  au!
  " Save window position when leaving buffers
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
augroup END

augroup FiletypeGroup
  au!
  au BufNewFile,BufRead *.org set filetype=org
augroup END

augroup QF
  au!
  au QuickFixCmdPost [^l]* cwindow
  au QuickFixCmdPost    l* lwindow
  au VimEnter            * cwindow
augroup END

augroup autoSaveAndRead
  autocmd!
  autocmd TextChanged,InsertLeave,FocusLost * silent! wall
  autocmd CursorHold *                        silent! checktime
augroup END
