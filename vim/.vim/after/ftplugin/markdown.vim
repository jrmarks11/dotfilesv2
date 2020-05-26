setlocal spell spelllang=en_us
set textwidth=200
set conceallevel=2

nmap <buffer> <cr> <Plug>(mkdx-checkbox-next-n)j
vmap <buffer> <cr> <Plug>(mkdx-checkbox-next-v)<esc>

nmap <buffer> s, <Plug>(mkdx-promote-header)
nmap <buffer> s. <Plug>(mkdx-demote-header)
nmap <buffer> sc <Plug>(mkdx-toggle-checklist-n)
vmap <buffer> sc <Plug>(mkdx-toggle-checklist-v)
nmap <buffer> sl <Plug>(mkdx-wrap-link-n)
vmap <buffer> sl <Plug>(mkdx-wrap-link-v)

nnoremap <buffer> sh yypVr=
nnoremap <buffer> sj yypVr-
nnoremap <buffer> so :read ~/.vim/snippets/oneonone.md<cr>kdd}o
nnoremap <buffer> st :read ~/.vim/snippets/teamlist.md<cr>

nnoremap <silent> <buffer> sd :e =substitute(system("date \"+%Y-%m-%d\""), '\n\+$', '', '')."\.md"<cr><cr>
nnoremap <silent> <buffer> sw :e =substitute(system("date -v+7d \"+%Y-%m-%d\""), '\n\+$', '', '')."\.md"<cr><cr>
