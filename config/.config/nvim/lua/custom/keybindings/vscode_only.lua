local function map(mode, key, vscode_command)
  local vscode = require 'vscode-neovim'

  vim.keymap.set(mode, key, function()
    vscode.call(vscode_command)
  end)
end

map('n', ']c', 'workbench.action.editor.nextChange')
map('n', '[c', 'workbench.action.editor.previousChange')
map('n', ',,', 'editor.action.formatDocument')
map('x', ',,', 'editor.action.formatSelection')
map({ 'x', 'n' }, '<leader><leader>', 'editor.action.startFindReplaceAction')
map('n', '<leader>d', 'workbench.files.action.showActiveFileInExplorer')
map('n', '<leader>r', 'workbench.action.showAllEditorsByMostRecentlyUsed')
map('n', '<leader>t', 'workbench.action.quickOpen')
