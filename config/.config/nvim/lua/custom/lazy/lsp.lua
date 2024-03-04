return {
  'neovim/nvim-lspconfig',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'j-hui/fidget.nvim',
    'rafamadriz/friendly-snippets'
  },

  config = function()
    require('fidget').setup({})
    require('custom.config.mason')
    require('custom.config.cmp')
    require('custom.config.diagnostic')
  end,

  cond = vim.fn.exists('g:vscode') == 0
}
