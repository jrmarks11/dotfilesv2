" Comma is my second leader key

nmap     ,, <Plug>(ale_fix)
nnoremap ,b :TestVisit<cr>zz
nnoremap ,c :PlugClean<cr>
nnoremap ,d :TestNearest<cr>
nnoremap ,f :TestFile<cr>
nnoremap ,j :Fd!<space>
nnoremap ,k :TestLast<cr>
nnoremap ,r :RenameFile<cr>
nnoremap ,s :TestSuite<cr>
nnoremap ,t :TestNearest<cr>
nnoremap ,u :PlugUpdate<cr>
nnoremap ,v :source $MYVIMRC<cr>
"        ,w is the vimwiki prefix
nmap     ,x <Plug>(ale_toggle_buffer)
