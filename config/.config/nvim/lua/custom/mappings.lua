require('custom.keybindings.all_editors')

if vim.fn.exists('g:vscode') == 0 then
  require('custom.keybindings.nvim_only')
else
  require('custom.keybindings.vscode_only')
end
