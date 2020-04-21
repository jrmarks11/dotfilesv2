command! DFiles call util#files_same_dir()
command! LastBuffer call util#last_buffer(0)
command! NoPastePaste call util#no_paste_paste()
command! RenameFile call util#rename_file()
command! SecondToLastBuffer call util#last_buffer(1)
command! SuperCarrot call util#super_carrot()

let s:fzf_grep_cmd =
      \ 'rg --column --line-number --no-heading --fixed-strings --smart-case'
      \ . " --hidden --follow --glob '!.git/*' --color 'always' "
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(s:fzf_grep_cmd .shellescape(<q-args>), 1,
      \ fzf#vim#with_preview('up:60%'), <bang>0)

let s:opts = '--reverse --preview-window top:60% ' .
          \  '--multi --bind alt-a:select-all,alt-d:deselect-all ' .
          \  '--preview "(bat --color "always" {} || cat {}) 2> /dev/null | head -'
          \  . &lines . '"'
command! -bang -nargs=* Fd call fzf#run(fzf#wrap('Fd',
      \ { 'source': util#fd(<q-args>), 'options': s:opts }, <bang>0))
command! -bang -nargs=* MRU call fzf#run(fzf#wrap('MRU',
      \ { 'source': util#all_files(), 'options': s:opts }, <bang>0))
