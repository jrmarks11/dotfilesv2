setlocal spell spelllang=en_us
set textwidth=200

if exists('b:taskpaper_ftplugin')
  finish
endif
let b:taskpaper_ftplugin = 1

nnoremap  <buffer> <Plug>TaskPaperToggle
      \ :<c-u>call taskpaper#toggle()<cr>
nnoremap  <buffer> <Plug>TaskPaperArchiveLine
      \ :<c-u>call taskpaper#archive_line()<cr>
nnoremap  <buffer> <Plug>TaskPaperO
      \ :<c-u>call taskpaper#o(1)<cr>
nnoremap  <buffer> <Plug>TaskPapero
      \ :<c-u>call taskpaper#o()<cr>
inoremap  <buffer> <Plug>TaskPaperNewLine
      \ <c-r>=taskpaper#newline()<cr>
xnoremap  <buffer> <Plug>TaskPaperArchiveVisual
      \ :<c-u>call taskpaper#archive_visual()<cr>

nmap <buffer> <cr> <Plug>TaskPaperToggle
nmap <buffer> -    <Plug>TaskPaperArchiveLine
nmap <buffer> o    <Plug>TaskPapero
nmap <buffer> O    <Plug>TaskPaperO
imap <buffer> <cr> <Plug>TaskPaperNewLine
xmap <buffer> -    <Plug>TaskPaperArchiveVisual
