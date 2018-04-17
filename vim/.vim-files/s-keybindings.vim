" using s as leader so that any plugins that do define leader keys will show
" up here. I am also mapping stuff from a lot of plugins to s keys.  I think
" of it as submodule. The s key is also automatically used by sandwich.

let g:mapleader='s'
nmap s <nop>
xmap s <nop>
nmap s' <Plug>(operator-sandwich-add)iw'
nmap s" <Plug>(operator-sandwich-add)iw"
   " sa is sandwich add
nmap sb <Plug>(operator-sandwich-add)iw{
nmap sB <Plug>(operator-sandwich-add)iw}
nmap sc :PlugClean<cr>
   " sd is sandwich delete
nmap se <Plug>(EasyAlign)
xmap se <Plug>(EasyAlign)
nmap sf <Plug>(ale_fix)
nmap sg g
   " shp is gitgutter hunk preview
   " shs is gitgutter hunk stage
   " shu is gitgutter hunk undo
nmap si i
   " sj is splitjoin join
nmap sk k
nmap sl <Plug>(operator-sandwich-add)iwilet(:<cr>) {  }<cr>f}hi
nmap sL <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)
       \<Plug>(textobj-sandwich-query-a)ilet(:<cr>).*<cr>
nmap sm m
nmap sn n
nmap so <Plug>(ale_toggle_buffer)
nmap sp <Plug>(operator-sandwich-add)iw(
   " sr is sandwich replace
   " ss is splitjoin split
   " st is switch (toggle)
nmap sq q
nmap su :PlugUpdate<cr>
nmap sv v
nmap sw w
nmap sx x
nmap sy y
nmap sz z

omap ad <Plug>(textobj-line-a)
vmap ad <Plug>(textobj-line-a)
omap id <Plug>(textobj-line-i)
vmap id <Plug>(textobj-line-i)
