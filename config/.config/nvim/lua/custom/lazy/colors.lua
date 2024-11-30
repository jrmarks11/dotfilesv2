return {
  'catppuccin/nvim',
  lazy = false,
  priority = 1000,
  name = 'catppuccin',

  config = function()
    vim.g.catppuccin_flavour = 'latte'
    require('catppuccin').setup {
      integrations = {
        mason = true,
        which_key = true,
      },
    }
  end,

  cond = vim.fn.exists 'g:vscode' == 0,
}
