if vim.g.vscode then
  return
end

vim.cmd.colorscheme 'catppuccin'
vim.g.catppuccin_flavour = 'latte'

local timer = vim.loop.new_timer()
timer:start(
  0,
  3000,
  vim.schedule_wrap(function()
    require('util.colorscheme').set_based_on_system_theme()
  end)
)
