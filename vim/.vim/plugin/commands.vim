command! DFiles call util#files_same_dir()
command! NoPastePaste call util#no_paste_paste()
command! RenameFile call util#rename_file()
command! SuperCarrot call util#super_carrot()
command! TwoFilesAgo call util#last_buffer(1)
command! -range=% FixTabs call util#fix_tabs(<line1>,<line2>)
command! TodayFilename call util#date_filename('+%Y-%m-%d')
command! NextWeekFilename call util#date_filename('-v+7d "+%Y-%m-%d"')

let s:fzf_grep_cmd =
      \ 'rg --column --line-number --no-heading --fixed-strings --smart-case'
      \ . " --hidden --follow --glob '!.git/*' --color 'always' "
command! -bang -nargs=* MyRg
      \ call fzf#vim#grep(s:fzf_grep_cmd .shellescape(<q-args>), 1,
      \ fzf#vim#with_preview('up:60%'), <bang>0)

let s:opts = '--preview-window top:60% ' .
          \  '--multi --bind alt-a:select-all,alt-d:deselect-all ' .
          \  '--preview "(bat --color "always" {} || cat {}) 2> /dev/null | head -'
          \  . &lines . '"'
command! -bang -nargs=* Fd call fzf#run(fzf#wrap('Fd',
      \ { 'source': util#fd(<q-args>), 'options': s:opts }, <bang>0))
command! -bang -nargs=* MRU call fzf#run(fzf#wrap('MRU',
      \ { 'source': util#all_files(), 'options': s:opts }, <bang>0))
