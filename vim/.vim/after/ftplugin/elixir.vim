command! TestFile call elixir#test_command('')
command! TestLine call elixir#test_command(':' . line('.'))

" nnoremap <space>o Obinding.pry<esc>
nnoremap <buffer> <space>r :TestLine<cr>
nnoremap <buffer> <space>u :TestFile<cr>
" nnoremap <space>w :g/^\W*\<binding.pry\>$/d<cr>
