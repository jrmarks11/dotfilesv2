command! RspecFile call ruby#rspec_command('')
command! RspecLine call ruby#rspec_command(':' . line('.'))

nnoremap <buffer> ,p Obinding.pry<esc>
nnoremap <buffer> ,t :RspecLine<cr>
nnoremap <buffer> ,f :RspecFile<cr>
nnoremap <buffer> ,y :g/^\W*\<binding.pry\>$/d<cr>

augroup SaveRecent
  autocmd!
  autocmd BufWrite *.rb  call ruby#set_ruby_mark()
augroup END
