" using s as leader so that any plugins that do define leader keys will show
" up here. I am also mapping stuff from a lot of plugins to s keys.  I think
" of it as submodule. The s key is also automatically used by sandwich.

let mapleader='s'
nmap s <nop>
xmap s <nop>
nnoremap s. :SidewaysRight<cr>
nnoremap s, :SidewaysLeft<cr>
nmap s' <Plug>(operator-sandwich-add)iw'
xmap s' <Plug>(operator-sandwich-add)'
nmap s" <Plug>(operator-sandwich-add)iw"
xmap s" <Plug>(operator-sandwich-add)"
   " sa is sandwich add
nmap sb <Plug>(operator-sandwich-add)iw{
xmap sb <Plug>(operator-sandwich-add)}==
nmap sB <Plug>(operator-sandwich-add)iw}
xmap sB <Plug>(operator-sandwich-add)}==
nnoremap sc :PlugClean<cr>
   " sd is sandwich delete
nmap se <Plug>(EasyAlign)
xmap se <Plug>(EasyAlign)
nmap sf <Plug>(ale_fix)
nmap sg g
   " shp is gitgutter hunk preview
   " shs is gitgutter hunk stage
   " shu is gitgutter hunk undo
nmap si i
nmap sj :SplitjoinJoin<cr>
nmap sk k
nmap sl l
nmap sm m
nmap sn n
nmap so <Plug>(ale_toggle_buffer)
nmap sp <Plug>(operator-sandwich-add)iw(
xmap sp <Plug>(operator-sandwich-add)(==
   " sr is sandwich replace
nmap ss :SplitjoinSplit<cr>
nmap st :Switch<cr>
nmap sq q
nnoremap su :PlugUpdate<cr>
nmap sv v
nmap sw w
nmap sx x
nmap sy y
nmap sz z

omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI
