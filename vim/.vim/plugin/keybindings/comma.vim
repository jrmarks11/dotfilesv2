" Comma is my second leader key

nmap     ,, <Plug>(ale_fix)
nnoremap ,<tab> <c-w>v:SuperCarrot<cr>
nnoremap ,a :AV<cr>
nnoremap ,b :TestVisit<cr>zz
nnoremap ,c :PlugClean<cr>
nnoremap ,d :TestNearest<cr>
map      ,e :e ..
nnoremap ,f :TestFile --format d<cr>
nmap     ,g <Plug>GitGutterStageHunk
nmap     ,h <Plug>GitGutterUndoHunk
nnoremap ,i "zyawoputs(<c-r>z)<esc>
nnoremap ,j :Fd!<space>
nnoremap ,k :TestLast<cr>
nnoremap ,p Obinding.pry<esc>
nnoremap ,r :RenameFile<cr>
nmap     ,s :TestSuite<cr>
nnoremap ,t :TestNearest<cr>
nnoremap ,v :source $MYVIMRC<cr>
nnoremap ,u :PlugUpdate<cr>
nmap     ,x <Plug>(ale_toggle_buffer)
nnoremap ,y :g/^\W*\<binding.pry\>$/d<cr>
