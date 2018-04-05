command! TestFile call elixir#test_command('')
command! TestLine call elixir#test_command(':' . line('.'))

nnoremap <buffer> <space>o Orequire<space>IEx;<space>IEx.pry()<esc>
nnoremap <buffer> <space>r :TestLine<cr>
nnoremap <buffer> <space>u :TestFile<cr>
nnoremap <buffer> <space>w :g/^\W*require IEx.*IEx.pry()$/d<cr>
