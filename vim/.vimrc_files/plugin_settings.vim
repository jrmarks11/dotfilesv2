" I dont need to check for whitespace becaause i auto remove trailing ws
let g:airline#extensions#whitespace#enabled = 0
" Use abreviations in airline for the most common modes ie: I for Insert
let g:airline_mode_map = { 'n':'N', 'i':'I', 'v':'V' }
" Using special terminal fonts for powerline
let g:airline_powerline_fonts = 1
" default g:airline_section_x (tagbar, filetype, virtualenv)
let g:airline_section_x = ''
" default g:airline_section_y (fileencoding, fileformat)
let g:airline_section_y = ''
" default g:airline_section_z (percentage, line number, column number)
let g:airline_section_z = '%c'
let g:airline_skip_empty_sections = 1
let g:airline_theme='tomorrow'

" I always reload gitgutter on any edit so n need for these to be on
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

" I want my own tmux navigator maps
let g:tmux_navigator_no_mappings = 1
