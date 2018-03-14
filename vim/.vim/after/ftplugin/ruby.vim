augroup Formatting
  autocmd!
  autocmd BufWritePre *.rb : %s/\n\n\n\+//e
  autocmd BufWritePre *.rb : %s/	/  /e
augroup END

augroup SaveRecent
  autocmd!
  autocmd BufWrite */app*.rb  normal! mR
  autocmd BufWrite */spec*_spec.rb  normal! mS
augroup END
