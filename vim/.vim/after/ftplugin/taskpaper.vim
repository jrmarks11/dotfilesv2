setlocal spell spelllang=en_us
set textwidth=200

if exists('b:taskpaper_ftplugin')
  finish
endif
let b:taskpaper_ftplugin = 1

nnoremap  <buffer> <Plug>TaskPaperToggle
      \ :<c-u>call taskpaper#toggle()<cr>

nmap <buffer> <cr> <Plug>TaskPaperToggle
