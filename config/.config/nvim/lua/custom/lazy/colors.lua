return {
  {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    name = 'catppuccin',
    config = function()
      vim.g.catppuccin_flavour = 'latte'
      require('catppuccin').setup {
        integrations = {
          cmp = true,
          gitsigns = true,
          mason = true,
          markdown = true,
          mini = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { 'undercurl' },
              hints = { 'undercurl' },
              warnings = { 'undercurl' },
              information = { 'undercurl' },
            },
          },
          navic = { enabled = true, custom_bg = 'lualine' },
          treesitter = true,
          treesitter_context = true,
          which_key = true,
        },
      }
    end,

    cond = vim.fn.exists 'g:vscode' == 0,
  },
}
