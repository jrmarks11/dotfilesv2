augroup Formatting
  autocmd!
  autocmd BufWritePre * : %s/\n\n\n\+//e
augroup END

augroup SaveRecent
  autocmd!
  autocmd BufWrite */app*.rb  normal! mR
  autocmd BufWrite */spec*_spec.rb  normal! mS
augroup END
