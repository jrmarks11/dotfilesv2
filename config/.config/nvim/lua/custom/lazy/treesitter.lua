return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPost', 'BufNewFile' },
  build = ':TSUpdate',

  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'css',
        'elixir',
        'embedded_template',
        'html',
        'javascript',
        'json',
        'lua',
        'regex',
        'ruby',
        'sql',
        'tsx',
        'typescript',
        'yaml',
        'vim',
      },

      highlight = { enable = true },
      auto_install = true,
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<cr>',
          node_incremental = '<tab>',
          scope_incremental = '<cr>',
          node_decremental = '<s-tab>',
        },
      },
    }
  end,
}
