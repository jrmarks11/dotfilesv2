setlocal colorcolumn=100
setlocal textwidth=98

command! -bang TestFile call elixir#test_command(<bang>0)
command! -bang TestLine call elixir#test_command(<bang>0,':' . line('.'))

nnoremap <buffer> ,d :TestLine!<cr>
nnoremap <buffer> ,f :TestFile<cr>
nnoremap <buffer> ,p Orequire<space>IEx;<space>IEx.pry()<esc>
nnoremap <buffer> ,t :TestLine<cr>
nnoremap <buffer> ,y :g/^\W*require IEx.*IEx.pry()$/d<cr>

nmap <buffer> sb <Plug>(operator-sandwich-add)iwi%{<cr>}<cr>
nmap <buffer> s' <Plug>(operator-sandwich-add)iw"

let s:switch_elixir_assert =
      \ {
      \   '\(assert\)': 'refute',
      \   '\(refute\)': 'assert',
      \ }
let s:switch_elixir_map =
      \  {
      \    ':\(\k\+\)\s*=>\s*': '\1: ',
      \    '\<\(\k\+\): ':      ':\1 => ',
      \  }

let b:switch_custom_definitions =
      \ [ s:switch_elixir_assert, s:switch_elixir_map ]

augroup SaveRecent
  autocmd!
  autocmd BufWrite *.ex normal! mE
  autocmd BufWrite *_test.exs normal! mT
augroup END
