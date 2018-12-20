command! RspecFile call ruby#rspec_command()
command! RspecLine call ruby#rspec_command(':' . line('.'))

nnoremap <buffer> ,f :RspecFile<cr>
nnoremap <buffer> ,d :RspecLine<cr>
nnoremap <buffer> ,p Obinding.pry<esc>
nnoremap <buffer> ,t :RspecLine<cr>
nnoremap <buffer> ,y :g/^\W*\<binding.pry\>$/d<cr>
