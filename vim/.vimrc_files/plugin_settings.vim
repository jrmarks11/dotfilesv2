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

let g:fugitive_github_domains = ['git.innova-partners.com']

" I always reload gitgutter on any edit so n need for these to be on
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0

let g:gutentags_ctags_tagfile = '.tags'

" Dont show the netrw banner
let g:netrw_banner = 0
" Open netrw files in the previous window
let g:netrw_browse_split = 4
" tree style listing in netrw
let g:netrw_liststyle = 3
" netrw is 15% of the screen
let g:netrw_winsize = 15

" I want my own tmux navigator maps
let g:tmux_navigator_no_mappings = 1