augroup Formatting
  autocmd!
  autocmd BufWritePre *.rb : %s/	/  /ge
  autocmd BufWritePre *.rb : %s/\n\n\n\+//e
augroup END
