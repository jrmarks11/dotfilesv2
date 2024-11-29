vim.g.mapleader = '<Space>'

require 'custom.lazy_init'

if not vim.g.vscode then
  require('util.colorscheme').set_based_on_system_theme()
  vim.cmd.colorscheme 'catppuccin'

  local timer = vim.loop.new_timer()
  timer:start(
    0,
    3000,
    vim.schedule_wrap(function()
      require('util.colorscheme').set_based_on_system_theme()
    end)
  )
end
