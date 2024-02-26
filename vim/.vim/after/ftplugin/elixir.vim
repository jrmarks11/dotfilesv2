setlocal colorcolumn=100
setlocal textwidth=98

command! -bang TestDebug call elixir#test_command(<bang>0,':' . line('.'))

nnoremap <buffer> ,d :TestDebug!<cr>
nnoremap <buffer> ,f :TestFile --trace<cr>
nnoremap <buffer> gd :ALEGoToDefinition<cr>

nnoremap <buffer> <space>m :Fd! --exclude '*_web*' '\.ex' lib<cr>
nnoremap <buffer> <space>v :Fd! '' lib/*_web/templates<cr>
