nnoremap <silent> [<space> :<c-u>put! =repeat(nr2char(10), v:count1)<cr>
nnoremap <silent> ]<space> :<c-u>put =repeat(nr2char(10), v:count1)<cr>

nmap     <silent> ]c <Plug>(GitGutterNextHunk)
nmap     <silent> [c <Plug>(GitGutterPrevHunk)
