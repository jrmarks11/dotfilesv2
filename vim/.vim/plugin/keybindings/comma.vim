" Comma is my second leader key

nnoremap ,<tab> <tab>
nnoremap ,<space> :cfdo %s/\<<c-r><c-w>\>//g<space><bar><space>update<s-left><s-left><left><left><left>
xnoremap ,<space> y:%s/<c-r><c-0>//g<space><bar><space>update<s-left><s-left><left><left><left>
nnoremap ,. :SidewaysRight<cr>
nmap     ,, <Plug>(ale_fix)
nnoremap ,a a
nnoremap ,b :TestVisit<cr>zz
nnoremap ,c :PlugClean<cr>
nnoremap ,d :TestNearest<cr>
nmap     ,e <Plug>(EasyAlign)
xmap     ,e <Plug>(EasyAlign)
nnoremap ,f :TestFile<cr>
nnoremap ,g <Plug>GitGutterStageHunk
nmap     ,h <Plug>GitGutterUndoHunk
"        ,i inspect word
nnoremap ,j :Fd!<space>
nnoremap ,k :TestLast<cr>
nnoremap ,l :lclose<cr>
nnoremap ,m :SidewaysLeft<cr>
nnoremap ,n n
nnoremap ,o o
"        ,p put a (p)ry above this line
nnoremap ,q :cclose<cr>
nnoremap ,r :RenameFile<cr>
nmap     ,s :TestSuite<cr>
nnoremap ,t :TestNearest<cr>
nnoremap ,v :source $MYVIMRC<cr>
nnoremap ,u :PlugUpdate<cr>
nnoremap ,x <Plug>(ale_toggle_buffer)
"        ,y remove pr(y)
nnoremap ,z :Zoom<cr>
