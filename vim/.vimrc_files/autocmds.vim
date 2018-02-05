augroup AutoResize
  au!
  au VimResized * wincmd =
augroup END

" Remove extra newlines and trailng whitspace when saving
augroup Formatting
  au!
  au BufWritePre * : %s/\n\n\n\+//e | %s/\s\+$//e
augroup END

" Save window position when leaving buffers
augroup RestoreCursorPosition
  au!
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
augroup END
