return {
  {
    'folke/tokyonight.nvim',
    lazy = true,
    -- priority = 1000,

    config = function()
      require('tokyonight').setup({
        style = 'day',
      })

      -- vim.o.background = 'light'
      -- vim.cmd.colorscheme('tokyonight')
    end,

    cond = vim.fn.exists('g:vscode') == 0
  },
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    config = function()
      vim.g.catppuccin_flavour = "latte"
      require('catppuccin').setup({
        integrations = {
          cmp = true,
          gitsigns = true,
          mason = true,
          markdown = true,
          mini = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
          navic = { enabled = true, custom_bg = "lualine" },
          treesitter = true,
          treesitter_context = true,
          which_key = true,
        },
      })
      vim.o.background = "light"
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  {
    'maxmx03/solarized.nvim',
    lazy = true,
    -- priority = 1000,
    config = function()
      -- vim.o.background = 'light'
      -- vim.cmd.colorscheme 'solarized'
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    -- priority = 1000,
    config = function()
      -- vim.o.background = "light"
      -- vim.cmd([[colorscheme gruvbox]])
    end,
  },
}
