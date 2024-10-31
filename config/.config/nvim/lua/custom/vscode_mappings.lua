local map = vim.keymap.set
local vscode = require('vscode-neovim')

map('n', ']c', function()
  vscode.call('workbench.action.editor.nextChange')
end)

map('n', '[c', function()
  vscode.call('workbench.action.editor.previousChange')
end)

map("n", "su", function()
  vscode.action('git.revertSelectedRanges')
end)

map('n', ',,', function()
  vscode.call('editor.action.formatDocument')
end)

map('x', ',,', function()
  vscode.call('editor.action.formatSelection')
end)

map('n', '<space>t', function()
  vscode.call('workbench.action.quickOpen')
end)

map('n', '<space>r', function()
  vscode.call('workbench.action.showAllEditorsByMostRecentlyUsed')
end)

map('n', '-', function()
  vscode.call('workbench.files.action.showActiveFileInExplorer')
end)
