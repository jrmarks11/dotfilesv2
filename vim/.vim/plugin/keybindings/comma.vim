" Comma is my second leader key

nnoremap ,<tab> <tab>
nnoremap ,<space> <space>
nnoremap ,. :SidewaysRight<cr>
nmap     ,, <Plug>(ale_fix)
nnoremap ,a :argadd<cr>
nnoremap ,b b
nnoremap ,c :PlugClean<cr>
"        ,d run tests with (d)ebugger
nmap     ,e <Plug>(EasyAlign)
xmap     ,e <Plug>(EasyAlign)
"        ,f run tests for the (f)ile
nnoremap ,g g
nmap     ,h <Plug>GitGutterUndoHunk
"        ,i inspect word
nnoremap ,j :Fd!<space>
nnoremap ,k k
nmap     ,l <Plug>(qf_loc_toggle_stay)
nnoremap ,m :SidewaysLeft<cr>
nnoremap ,n n
nnoremap ,o <c-w>o
"        ,p put a (p)ry above this line
nmap     ,q <Plug>(qf_qf_toggle_stay)
nnoremap ,r :RenameFile<cr>
nmap     ,s s
"        ,t run nearest (t)est
nnoremap ,v v
nnoremap ,u :PlugUpdate<cr>
nnoremap ,x <Plug>(ale_toggle_buffer)
"        ,y remove pr(y)
nnoremap ,z :tabe %<cr>
