" Remove extra newlines and trailng whitspace when saving
augroup MyFormatting
  autocmd BufWritePre * : %s/\n\n\n\+//e | %s/\s\+$//e
augroup END
