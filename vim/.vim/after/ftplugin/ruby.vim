command! RspecFile call ruby#rspec_command('')
command! RspecLine call ruby#rspec_command(':' . line('.'))

nnoremap <buffer> <space>o Obinding.pry<esc>
nnoremap <buffer> <space>r :RspecLine<cr>
nnoremap <buffer> <space>u :RspecFile<cr>
nnoremap <buffer> <space>w :g/^\W*\<binding.pry\>$/d<cr>

augroup SaveRecent
  autocmd!
  autocmd BufWrite *.rb  call ruby#set_ruby_mark()
augroup END
