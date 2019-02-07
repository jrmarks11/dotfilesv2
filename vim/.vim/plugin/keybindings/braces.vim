" Inspired by vim-impaired but i prefer to only bind the things i use. I like
" to think of [ and ] as navigation leader or toggle

nnoremap [<space> :<c-u>put! =repeat(nr2char(10), v:count1)<cr>
nnoremap ]<space> :<c-u>put =repeat(nr2char(10), v:count1)<cr>
nnoremap ]a :next<cr>
nnoremap [a :prev<cr>
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>
nmap     ]c <Plug>GitGutterNextHunk
nmap     [c <Plug>GitGutterPrevHunk
nnoremap [e :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e :<c-u>execute 'move +'. v:count1<cr>
xnoremap [e :<c-u>execute "'<, '>move'<--" . v:count1<cr>gv
xnoremap ]e :<c-u>execute "'<, '>move'>+" . v:count1<cr>gv
nnoremap ]l :lnext<cr>zz
nnoremap [l :lprev<cr>zz
nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz
nnoremap ]t :tnext<cr>
nnoremap [t :tprevious<cr>
