augroup AutoResize
  au!
  au VimResized * wincmd =
augroup END

augroup AutoSaveAndRead
  au!
  au TextChanged,InsertLeave,FocusLost * silent! wall | GitGutter
  au CursorHold *                        silent! checktime
augroup END

  " Remove extra newlines and trailng whitspace when saving
augroup Formatting
  au!
  au BufWritePre * : %s/\n\n\n\+//e | %s/\s\+$//e
augroup END

augroup QuickFix
  au!
  au QuickFixCmdPost [^l]* cwindow
  au QuickFixCmdPost    l* lwindow
  au VimEnter            * cwindow
augroup END

  " Save window position when leaving buffers
augroup RestoreCursorPositionGroup
  au!
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
augroup END
