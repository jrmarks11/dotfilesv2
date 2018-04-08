" using s as leader so that any plugins that do define leader keys will show
" up here. I am also mapping stuff from a lot of plugins to s keys.  I think
" of it as submodule. The s key is also automatically used by sandwich.

let g:mapleader='s'
nmap s <nop>
xmap s <nop>
   " sa is sandwich add
nmap sc :PlugClean<cr>
   " sd is sandwich delete
nmap sf <Plug>(ale_fix)
   " shp is gitgutter hunk preview
   " shs is gitgutter hunk stage
   " shu is gitgutter hunk undo
   " sj is splitjoin join
nmap sl <Plug>(EasyAlign)
xmap sl <Plug>(EasyAlign)
nmap so <Plug>(ale_toggle_buffer)
   " sr is sandwich replace
   " ss is splitjoin split
   " st is switch (toggle)
nmap su :PlugUpdate<cr>

omap ad <Plug>(textobj-line-a)
vmap ad <Plug>(textobj-line-a)
omap id <Plug>(textobj-line-i)
vmap id <Plug>(textobj-line-i)
