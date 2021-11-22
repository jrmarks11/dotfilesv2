setlocal spell spelllang=en_us
set textwidth=200
set conceallevel=2

nmap <buffer> sc I-<space>[<space>]<space><esc>
nmap <buffer> <return> $:s/\[<space>\]/\[X\]/<cr>j

nnoremap <buffer> so :read ~/.vim/snippets/oneonone.md<cr>kddGo
nnoremap <buffer> st :read ~/.vim/snippets/teamlist.md<cr>

nnoremap <silent> <buffer> sd :e =substitute(system("date \"+%Y-%m-%d\""), '\n\+$', '', '')."\.md"<cr><cr>
nnoremap <silent> <buffer> sw :e =substitute(system("date -v+7d \"+%Y-%m-%d\""), '\n\+$', '', '')."\.md"<cr><cr>
