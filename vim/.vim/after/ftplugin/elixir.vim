setlocal colorcolumn=100
setlocal textwidth=98

command! -bang TestFile call elixir#test_command('', <bang>0)
command! -bang TestLine call elixir#test_command(':' . line('.'), <bang>0)

nnoremap <buffer> ,d :TestLine!<cr>
nnoremap <buffer> ,f :TestFile<cr>
nnoremap <buffer> ,p Orequire<space>IEx;<space>IEx.pry()<esc>
nnoremap <buffer> ,t :TestLine<cr>
nnoremap <buffer> ,y :g/^\W*require IEx.*IEx.pry()$/d<cr>

augroup SaveRecent
  autocmd!
  autocmd BufWrite *.ex normal! mE
  autocmd BufWrite *_test.exs normal! mT
augroup END
