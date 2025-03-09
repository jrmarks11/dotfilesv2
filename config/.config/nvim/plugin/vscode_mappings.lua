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
map('n', 'sv', function()
  vscode.call 'git.openChange'
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

map('x', '<space>f', function()
  local lines = vim.fn.getline("'<", "'>")
  if type(lines) == 'string' then
    lines = { lines }
  end
  local s = table.concat(lines, '\n')
  vscode.call 'workbench.action.terminal.focus'
  vscode.call('workbench.action.terminal.sendSequence', { args = { text = 'rg --hidden ' .. s .. '\n' } })
end)

map('n', '<space>f', function()
  local word = vim.fn.expand '<cword>'
  vscode.call 'workbench.action.terminal.focus'
  vscode.call('workbench.action.terminal.sendSequence', { args = { text = 'rg --hidden ' .. word .. '\n' } })
end)

map('n', '<space>a', function()
  local file = vim.fn.expand('%')
  local abs_path = vim.fn.fnamemodify(file, ':p')
  local alt

  if abs_path:match('test/.*_test.exs$') then
    alt = abs_path:gsub('test/(.*)_test.exs$', 'lib/%1.ex')
  else
    alt = abs_path:gsub('lib/(.*).ex$', 'test/%1_test.exs')
  end

  vim.cmd("call VSCodeExtensionNotify('open-file', '" .. alt .. "', 0)")
end)
