return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
  build = ':TSUpdate',

  config = function()
    require('nvim-treesitter.configs').setup {
      modules = {},
      sync_install = false,
      ignore_install = {},
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
        'vim',
        'vue',
        'yaml',
        'comment',
      },

      highlight = { enable = true },
      auto_install = true,
      indent = { enable = true },

      textobjects = {
        move = {
          enable = true,
          goto_next_start = { [']f'] = '@function.outer' },
          goto_next_end = { [']F'] = '@function.outer' },
          goto_previous_start = { ['[f'] = '@function.outer' },
          goto_previous_end = { ['[F'] = '@function.outer' },
        },
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<cr>',
          node_decremental = '<bs>',
          node_incremental = '<cr>',
          scope_incremental = '<tab>',
        },
      },
    }
  end,
}
