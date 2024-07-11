return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
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
        'vim',
        'yaml',
      },

      highlight = { enable = true },
      auto_install = true,
      indent = { enable = true },

      textobjects = {
        move = {
          enable = true,
          goto_next_start = { [']f'] = '@function.outer', [']a'] = '@parameter.inner' },
          goto_next_end = { [']F'] = '@function.outer', [']A'] = '@parameter.inner' },
          goto_previous_start = { ['[f'] = '@function.outer', ['[a'] = '@parameter.inner' },
          goto_previous_end = { ['[F'] = '@function.outer', ['[A'] = '@parameter.inner' },
        },
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<cr>',
          node_incremental = '<tab>',
          scope_incremental = false,
          node_decremental = '<s-tab>',
        },
      },
    }
  end,
}
