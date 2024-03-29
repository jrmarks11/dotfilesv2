return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },

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
  },

  config = function()
    require('custom.config.mason')
    require('custom.config.cmp')
    require('custom.config.diagnostic')
    require('custom.config.luasnip')
  end,

  cond = vim.fn.exists('g:vscode') == 0
}
