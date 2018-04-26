" Inspired by vim-impaired but i prefer to only bind the things i use. I like
" to think of [ and ] as navigation leader or toggle

nnoremap [<space> :<c-u>put! =repeat(nr2char(10), v:count1)<cr>
nnoremap ]<space> :<c-u>put =repeat(nr2char(10), v:count1)<cr>
nnoremap ]a :next<cr>
nnoremap [a :previous<cr>
nnoremap ]b :bnext<cr>
nnoremap [b :bprevious<cr>
nnoremap [e :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e :<c-u>execute 'move +'. v:count1<cr>
xnoremap [e :<c-u>execute "'<, '>move'<--" . v:count1<cr>gv
xnoremap ]e :<c-u>execute "'<, '>move'>+" . v:count1<cr>gv
nmap     ]l <Plug>(qf_loc_next)
nmap     [l <Plug>(qf_loc_previous)
nmap     ]q <Plug>(qf_qf_next)
nmap     [q <Plug>(qf_qf_previous)
nnoremap ]t :tnext<cr>
nnoremap [t :tprevious<cr>
