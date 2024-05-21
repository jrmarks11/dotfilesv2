return {
  'nvim-lualine/lualine.nvim',
  event = { 'VeryLazy' },
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    require('lualine').setup {
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'grapple' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,

  cond = vim.fn.exists 'g:vscode' == 0,
}
