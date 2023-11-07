" Inspired by vim-impaired but i prefer to only bind the things i use. I like
" to think of [ and ] as navigation leader or toggle

nnoremap <silent> [<space> :<c-u>put! =repeat(nr2char(10), v:count1)<cr>
nnoremap <silent> ]<space> :<c-u>put =repeat(nr2char(10), v:count1)<cr>
