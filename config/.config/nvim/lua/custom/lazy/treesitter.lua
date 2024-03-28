return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },

  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'css',
        'elixir',
        'embedded_template',
        'html',
        'javascript',
        'json',
        'regex',
        'ruby',
        'tsx',
        'typescript',
        'yaml',
      },

      highlight = { enable = true },
      auto_install = true,
      indent = { enable = true },
      textobjects = {
        enable = true,
        lookahead = true,
        select = {
          enable = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['ak'] = '@block.outer',
            ['ik'] = '@block.inner',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['s.'] = '@parameter.inner',
          },
          swap_previous = {
            ['s,'] = '@parameter.inner',
          },
        },
      },
    })
  end,

  cond = vim.fn.exists('g:vscode') == 0
}
