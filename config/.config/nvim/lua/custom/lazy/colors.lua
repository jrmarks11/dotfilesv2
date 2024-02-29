return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,

    config = function()
      require('tokyonight').setup({
        style = 'light',
        transparent = false,
        terminal_colors = false,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          sidebars = 'light',
          floats = 'light',
        },
      })
      vim.o.background = 'light'
      vim.cmd.colorscheme('tokyonight')
    end
  },
}
