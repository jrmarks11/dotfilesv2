setlocal colorcolumn=100
setlocal textwidth=98

command! -bang TestDebug call elixir#test_command(<bang>0,':' . line('.'))

nnoremap <buffer> ,d :TestDebug!<cr>
nnoremap <buffer> ,f :TestFile --trace<cr>
nnoremap <buffer> ,i "zyawoIO.inspect(<c-r>z)<esc>
nnoremap <buffer> ,p Orequire<space>IEx;<space>IEx.pry()<esc>
nnoremap <buffer> ,y :g/^\W*require IEx.*IEx.pry()$/d<cr>
nnoremap <buffer> <c-]> :ALEGoToDefinition<cr>
