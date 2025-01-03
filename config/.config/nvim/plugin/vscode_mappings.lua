if not vim.g.vscode then
  return
end

local map = vim.keymap.set
local vscode = require 'vscode-neovim'

map('n', ']c', function()
  vscode.call 'workbench.action.editor.nextChange'
end)
map('n', '[c', function()
  vscode.call 'workbench.action.editor.previousChange'
end)
map('n', ']d', function()
  vscode.call 'editor.action.marker.next'
end)
map('n', '[d', function()
  vscode.call 'editor.action.marker.prev'
end)
map('n', 'su', function()
  vscode.call 'git.revertSelectedRanges'
end)
map('n', 'sg', function()
  vscode.call 'git.stageSelectedRanges'
end)
map('n', ',,', function()
  vscode.call 'editor.action.formatDocument'
end)
map('x', ',,', function()
  vscode.call 'editor.action.formatSelection'
end)
map('n', '<space>t', function()
  vscode.call 'workbench.action.quickOpen'
end)
map('n', '<space>r', function()
  vscode.call 'workbench.action.showAllEditorsByMostRecentlyUsed'
end)
map('n', '-', function()
  vscode.call 'workbench.files.action.showActiveFileInExplorer'
end)
map('n', ']q', function()
  vscode.call 'search.action.focusNextSearchResult'
end)
map('n', '[q', function()
  vscode.call 'search.action.focusPreviousSearchResult'
end)

map('x', '<space>f', function()
  vscode.call 'editor.action.addSelectionToNextFindMatch'
  vscode.call 'workbench.action.findInFiles'
end)

map('n', '<space>f', function()
  vscode.call('workbench.action.findInFiles', { args = { query = vim.fn.expand '<cword>' } })
end)
