" Comma is my second leader key

nnoremap ,<tab> <c-w>v:LastBuffer<cr>
nnoremap ,<space> :'{,'}s/\<<c-r><c-w>\>//g<left><left><c-r><c-w>
nnoremap ,. :SidewaysRight<cr>
nmap     ,, <Plug>(ale_fix)
nnoremap ,a :argadd<cr>
nnoremap ,b :TestVisit<cr>zz
nnoremap ,c :PlugClean<cr>
nnoremap ,d :TestNearest<cr>
nmap     ,e <Plug>(EasyAlign)
xmap     ,e <Plug>(EasyAlign)
nnoremap ,f :TestFile<cr>
nnoremap ,g g
nmap     ,h <Plug>GitGutterUndoHunk
"        ,i inspect word
nnoremap ,j :Fd!<space>
nnoremap ,k :TestLast<cr>
nmap     ,l <Plug>(qf_loc_toggle_stay)
nnoremap ,m :SidewaysLeft<cr>
nnoremap ,n n
nnoremap ,o <c-w>o
"        ,p put a (p)ry above this line
nmap     ,q <Plug>(qf_qf_toggle_stay)
nnoremap ,r :RenameFile<cr>
nmap     ,s :TestSuite<cr>
nnoremap ,t :TestNearest<cr>
nnoremap ,v :source $MYVIMRC<cr>
nnoremap ,u :PlugUpdate<cr>
nnoremap ,x <Plug>(ale_toggle_buffer)
"        ,y remove pr(y)
nnoremap ,z :Zoom<cr>
