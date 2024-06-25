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
        'yaml',
        'vim',
      },

      highlight = { enable = true },
      auto_install = true,
      indent = { enable = true },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = { [']f'] = '@function.outer', [']c'] = '@class.outer', [']a'] = '@parameter.inner' },
          goto_next_end = { [']F'] = '@function.outer', [']C'] = '@class.outer', [']A'] = '@parameter.inner' },
          goto_previous_start = { ['[f'] = '@function.outer', ['[c'] = '@class.outer', ['[a'] = '@parameter.inner' },
          goto_previous_end = { ['[F'] = '@function.outer', ['[C'] = '@class.outer', ['[A'] = '@parameter.inner' },
        },
      },
    }
  end,
}
