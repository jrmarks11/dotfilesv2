return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,

  config = function()
    require('tokyonight').setup({
      style = 'day',
    })
    vim.o.background = 'light'
    vim.cmd.colorscheme('tokyonight')
  end,

  cond = vim.fn.exists('g:vscode') == 0
}
