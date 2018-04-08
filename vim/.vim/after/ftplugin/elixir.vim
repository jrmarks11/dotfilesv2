setlocal colorcolumn=100
setlocal textwidth=98

command! TestDebug call elixir#test_command(':' . line('.'), 1)
command! TestFile call elixir#test_command()
command! TestLine call elixir#test_command(':' . line('.'))

nnoremap <buffer> ,d :TestDebug<cr>
nnoremap <buffer> ,f :TestFile<cr>
nnoremap <buffer> ,p Orequire<space>IEx;<space>IEx.pry()<esc>
nnoremap <buffer> ,t :TestLine<cr>
nnoremap <buffer> ,y :g/^\W*require IEx.*IEx.pry()$/d<cr>

augroup SaveRecent
  autocmd!
  autocmd BufWrite *.ex normal! mE
  autocmd BufWrite *_test.exs normal! mT
augroup END
