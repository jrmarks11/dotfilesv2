setlocal spell spelllang=en_us
set textwidth=200

if exists('b:taskpaper_ftplugin')
  finish
endif
let b:taskpaper_ftplugin = 1

nnoremap  <buffer> <Plug>TaskPaperToggle
      \ :<c-u>call taskpaper#toggle()<cr>

nmap <buffer> <cr> <Plug>TaskPaperToggle

iabbrev <buffer> ;o -<space>How<space>is<space>it<space>going?<cr>-<space>Your<space>Agenda<cr>-<space>Highs<space>and<space>lows<cr>-<space>Corona
