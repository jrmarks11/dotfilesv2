vim.cmd.colorscheme 'catppuccin-nvim'
vim.g.catppuccin_flavour = 'latte'

local timer = assert(vim.uv.new_timer())

timer:start(
  0,
  3000,
  vim.schedule_wrap(function()
    require('util.colorscheme').set_based_on_system_theme()
  end)
)
