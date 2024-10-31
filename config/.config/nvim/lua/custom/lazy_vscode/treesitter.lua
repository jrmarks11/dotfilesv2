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
        'comment',
      },

      highlight = { enable = false },
      auto_install = true,
      indent = { enable = false },

      textobjects = {
        move = {
          enable = true,
          goto_next_start = { [']f'] = '@function.outer' },
          goto_next_end = { [']F'] = '@function.outer' },
          goto_previous_start = { ['[f'] = '@function.outer' },
          goto_previous_end = { ['[F'] = '@function.outer' },
        },
      },
    }
  end,
}
