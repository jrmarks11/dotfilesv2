setlocal tabstop=4 shiftwidth=4

command! PhpUnitFile call php#unit_command()

nnoremap <buffer> ,f :PhpUnitFile<cr>
nnoremap <buffer> ,i "zyawoprint<space>"\n<c-r>z:<space>{$<c-r>z}\n";<esc>
