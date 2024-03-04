return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,

  config = function()
    require('tokyonight').setup({
      style = 'moon',
    })
    vim.o.background = 'dark'
    vim.cmd.colorscheme('tokyonight')
  end,
  cond = vim.fn.exists('g:vscode') == 0
}
