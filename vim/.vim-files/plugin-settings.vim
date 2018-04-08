let g:ale_fixers = {
      \   'bash': ['shellcheck'],
      \   'elixir': ['mix_format'],
      \   'javascript': ['standard'],
      \   'ruby': ['rubocop'],
      \ }
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 'normal'

let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \   'bg':      ['bg', 'Normal'],
      \   'hl':      ['fg', 'Comment'],
      \   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \   'hl+':     ['fg', 'Statement'],
      \   'info':    ['fg', 'PreProc'],
      \   'border':  ['fg', 'Ignore'],
      \   'prompt':  ['fg', 'Conditional'],
      \   'pointer': ['fg', 'Exception'],
      \   'marker':  ['fg', 'Keyword'],
      \   'spinner': ['fg', 'Label'],
      \   'header':  ['fg', 'Comment'] }
let g:fzf_files_options =
      \ '--reverse ' .
      \ '--preview "(coderay {} || rougify {} || cat {}) 2> /dev/null | head -'
      \ . &lines . '"'

let g:gutentags_ctags_tagfile = '.tags'

let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
      \ {'buns': ['`', '`'], 'quoteescape': 1, 'expand_range': 0, 'nesting': 0,
      \  'linewise': 0, 'match_syntax': 1},
      \ {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1,
      \  'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
      \ {'buns': ['{\s*', '\s*}'], 'nesting': 1, 'regex': 1, 'match_syntax': 1,
      \  'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'],
      \  'input': ['{']},
      \ ]

let g:splitjoin_join_mapping = 'sj'
let g:splitjoin_split_mapping = 'ss'

let g:switch_mapping = 'st'

let g:textobj_line_no_default_key_mappings = 1

let g:tmux_navigator_no_mappings = 1

let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsSnippetDirectories=['Snips', 'UltiSnips']
