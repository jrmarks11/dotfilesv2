augroup Formatting
  autocmd!
  autocmd BufWritePre *.rb : %s/	/  /ge
  autocmd BufWritePre *.rb : %s/\n\n\n\+//e
augroup END

augroup SaveRecent
  autocmd!
  autocmd BufWrite *.rb  call s:set_ruby_mark()
augroup END

function! s:set_ruby_mark()
  if expand('%:t') =~# '/*_spec\.rb'
    normal! mS
  else
    normal! mR
  end
endfunction
