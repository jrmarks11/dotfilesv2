setlocal spell spelllang=en_us

if exists('b:taskpaper_ftplugin')
  finish
endif
let b:taskpaper_ftplugin = 1

nnoremap  <buffer> <Plug>TaskPaperToggle
      \ :<c-u>call taskpaper#toggle()<cr>
nnoremap  <buffer> <Plug>TaskPaperArchiveLine
      \ :<c-u>call taskpaper#archive_line()<cr>
xnoremap  <buffer> <Plug>TaskPaperArchiveVisual
      \ :<c-u>call taskpaper#archive_visual()<cr>

nmap <silent><buffer> <cr> <Plug>TaskPaperToggle
nmap <silent><buffer> -    <Plug>TaskPaperArchiveLine
xmap <silent><buffer> -    <Plug>TaskPaperArchiveVisual

