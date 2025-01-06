return {
  'catppuccin/nvim',
  lazy = false,
  name = 'catppuccin',
  priority = 1000,

  opts = {
    integrations = {
      mason = true,
      which_key = true,
    },
  },

  init = function()
    vim.g.catppuccin_flavour = 'latte'
  end,

  cond = vim.fn.exists 'g:vscode' == 0,
}
