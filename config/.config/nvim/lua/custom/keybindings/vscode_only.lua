local map = vim.keymap.set
local vscode = require 'vscode-neovim'

map('n', ']c', function()
  vscode.call 'workbench.action.editor.nextChange'
end)

map('n', '[c', function()
  vscode.call 'workbench.action.editor.previousChange'
end)

map('n', ',,', function()
  vscode.call 'editor.action.formatDocument'
end)

map('x', ',,', function()
  vscode.call 'editor.action.formatSelection'
end)

map('n', '<leader>t', function()
  vscode.call 'workbench.action.quickOpen'
end)

map({ 'x', 'n' }, '<leader><leader>', function()
  vscode.call 'editor.action.startFindReplaceAction'
end)

map('n', '<leader>r', function()
  vscode.call 'workbench.action.showAllEditorsByMostRecentlyUsed'
end)

map('n', '<leader>d', function()
  vscode.call 'workbench.files.action.showActiveFileInExplorer'
end)
