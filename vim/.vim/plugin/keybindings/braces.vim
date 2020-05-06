" Inspired by vim-impaired but i prefer to only bind the things i use. I like
" to think of [ and ] as navigation leader or toggle

nnoremap <silent> [<space> :<c-u>put! =repeat(nr2char(10), v:count1)<cr>
nnoremap <silent> ]<space> :<c-u>put =repeat(nr2char(10), v:count1)<cr>
nnoremap <silent> ]a :next<cr>
nnoremap <silent> [a :prev<cr>
nnoremap <silent> ]b :bnext<cr>
nnoremap <silent> [b :bprev<cr>
nnoremap <silent> [e :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap <silent> ]e :<c-u>execute 'move +'. v:count1<cr>
xnoremap <silent> [e :<c-u>execute "'<, '>move'<--" . v:count1<cr>gv
xnoremap <silent> ]e :<c-u>execute "'<, '>move'>+" . v:count1<cr>gv
nnoremap <silent> ]l :lnext<cr>zz
nnoremap <silent> [l :lprev<cr>zz
nnoremap <silent> ]q :cnext<cr>zz
nnoremap <silent> [q :cprev<cr>zz
