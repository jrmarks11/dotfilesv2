syn case ignore

syn match taskpaperTag      /@\w\+/
syn match taskpaperTodo     /^\W*-\W\+\zs.\{-}\ze@/
syn match taskpaperTodo     /^\W*-\W*\zs\(.*@\)\@!.*$/
syn match taskpaperDoneTodo /^\W*-\W*\zs.*\ze@done.*$/
syn match taskpaperComment  /^\(\W*-\W*\)\@!.*/
syn match taskpaperDone     /@done(.*)/

syn sync fromstart

hi def link taskpaperComment  Comment
hi def link taskpaperTodo     Todo
hi def link taskpaperDoneTodo Function
hi def link taskpaperTag      Identifier
hi def link taskpaperDone     Conditional
