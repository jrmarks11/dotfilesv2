function s:update_fzf_colors()
  let l:rules =
  \ { 'fg':      [['Normal',       'fg']],
    \ 'bg':      [['Normal',       'bg']],
    \ 'hl':      [['Comment',      'fg']],
    \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
    \ 'bg+':     [['CursorColumn', 'bg']],
    \ 'hl+':     [['Statement',    'fg']],
    \ 'info':    [['PreProc',      'fg']],
    \ 'prompt':  [['Conditional',  'fg']],
    \ 'pointer': [['Exception',    'fg']],
    \ 'marker':  [['Keyword',      'fg']],
    \ 'spinner': [['Label',        'fg']],
    \ 'header':  [['Comment',      'fg']] }
  let l:cols = []
  for [l:name, l:pairs] in items(l:rules)
    for l:pair in l:pairs
      let l:code = synIDattr(synIDtrans(hlID(l:pair[0])), l:pair[1])
      if !empty(l:name) && l:code > 0
        call add(l:cols, l:name.':'.l:code)
        break
      endif
    endfor
  endfor
  let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
  let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
        \ empty(l:cols) ? '' : (' --color='.join(l:cols, ','))
endfunction

augroup _fzf
  autocmd!
  autocmd ColorScheme * call <SID>update_fzf_colors()
augroup END

set background=light
colorscheme PaperColor
highlight LineNr guifg=#cccccc
