let g:ale_fixers = {
      \   'bash': ['shellcheck'],
      \   'elixir': ['mix_format'],
      \   'javascript': ['standard'],
      \   'ruby': ['rubocop'],
      \ }

let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 'normal'

nmap sf <Plug>(ale_fix)
nmap so <Plug>(ale_toggle_buffer)
