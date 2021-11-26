setlocal spell spelllang=en_us
set textwidth=200
set conceallevel=2

nnoremap <buffer> so :read ~/.vim/snippets/oneonone.md<cr>ki=system("parse_name.rb " . expand('%:r'))<cr><esc>ddggv$
nnoremap <buffer> st :read ~/.vim/snippets/teamlist.md<cr>

nnoremap <silent> <buffer> sd o*<space>=system("date \"+%Y-%m-%d\"-")<cr><bs>=expand('%:t:r')<cr><esc>v0ll
nnoremap <silent> <buffer> sw o*<space>=system("date -v+7d \"+%Y-%m-%d\"-")<cr><bs>=expand('%:t:r')<cr><esc>v0ll
