command! RspecFile call ruby#rspec_command('')
command! RspecLine call ruby#rspec_command(':' . line('.'))

nnoremap <space>o Obinding.pry<esc>
nnoremap <space>r :RspecLine<cr>
nnoremap <space>u :RspecFile<cr>
nnoremap <space>w :g/^\W*\<binding.pry\>$/d<cr>

augroup SaveRecent
  autocmd!
  autocmd BufWrite *.rb  call ruby#set_ruby_mark()
augroup END
