setlocal spell spelllang=en_us
set textwidth=200
set conceallevel=2

nnoremap <buffer> so :read ~/.vim/snippets/oneonone.md<cr>
nnoremap <buffer> st :read ~/.vim/snippets/teamlist.md<cr>

nnoremap <silent> <buffer> sd :TodayFilename<cr>
nnoremap <silent> <buffer> sw :NextWeekFilename<cr>
