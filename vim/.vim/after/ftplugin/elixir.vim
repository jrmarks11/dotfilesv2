setlocal colorcolumn=100
setlocal textwidth=98

command! -bang TestDebug call elixir#test_command(<bang>0,':' . line('.'))

nnoremap <buffer> ,d :TestDebug!<cr>
nnoremap <buffer> ,f :TestFile --trace<cr>
nnoremap <buffer> gd :ALEGoToDefinition<cr>
