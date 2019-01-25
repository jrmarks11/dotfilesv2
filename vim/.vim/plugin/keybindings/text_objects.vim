silent! omap aa <Plug>SidewaysArgumentTextobjA
silent! xmap aa <Plug>SidewaysArgumentTextobjA
silent! omap ia <Plug>SidewaysArgumentTextobjI
silent! xmap ia <Plug>SidewaysArgumentTextobjI

silent! omap <unique> ib <Plug>(textobj-sandwich-auto-i)
silent! xmap <unique> ib <Plug>(textobj-sandwich-auto-i)
silent! omap <unique> ab <Plug>(textobj-sandwich-auto-a)
silent! xmap <unique> ab <Plug>(textobj-sandwich-auto-a)

" ----------------------------------------------------------------------------
" ?ai | around indent (all indentation including whitespace blocks)
" ----------------------------------------------------------------------------
xnoremap <silent> ai :<c-u>call to#indent_object('>=', 1, line("'<"), line("'>"), 0, 0)<cr>
onoremap <silent> ai :<c-u>call to#indent_object('>=', 1, line('.'), line('.'), 0, 0)<cr>

" ----------------------------------------------------------------------------
" ?am | delte ai but one above and below
" ----------------------------------------------------------------------------
xnoremap <silent> am :<c-u>call to#indent_object('>=', 1, line("'<"), line("'>"), -1, 1)<cr>
onoremap <silent> am :<c-u>call to#indent_object('>=', 1, line('.'), line('.'), -1, 1)<cr>

" ----------------------------------------------------------------------------
" ?ii | inside indent (all indentation within current whitespace)
" ----------------------------------------------------------------------------
xnoremap <silent> ii :<c-u>call to#indent_object('==', 0, line("'<"), line("'>"), 0, 0)<cr>
onoremap <silent> ii :<c-u>call to#indent_object('==', 0, line('.'), line('.'), 0, 0)<cr>

<" ----------------------------------------------------------------------------
" ,I/A | Prepend/Append to all adjacent lines with same indentation
" ----------------------------------------------------------------------------
nmap <silent> ,I ^vii<C-V>I
nmap <silent> ,A ^vii<C-V>$A

" ----------------------------------------------------------------------------
" ?ae | entire object
" ----------------------------------------------------------------------------
xnoremap <silent> ae gg0oG$
onoremap <silent> ae :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<CR>

" ----------------------------------------------------------------------------
" ?il | inner line
" ----------------------------------------------------------------------------
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<CR>
