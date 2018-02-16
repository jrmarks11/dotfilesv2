let g:fzf_files_options =
  \ '--reverse ' .
  \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0

let g:gutentags_ctags_tagfile = '.tags'

let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
      \   {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1,
      \    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
      \   {'buns': ['{\s*', '\s*}'],   'nesting': 1, 'regex': 1,
      \    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
      \    'action': ['delete'], 'input': ['{']},
      \   {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1,
      \    'kind': ['add', 'replace'], 'action': ['add'], 'input': [')']},
      \   {'buns': ['(\s*', '\s*)'],   'nesting': 1, 'regex': 1,
      \    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
      \    'action': ['delete'], 'input': [')']}
      \ ]

let g:splitjoin_split_mapping = 'ss'
let g:splitjoin_join_mapping = 'sj'
let g:switch_mapping = 'st'
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
let g:tmux_navigator_no_mappings = 1
