return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPost', 'BufNewFile' },
  build = ':TSUpdate',

  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },

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
        enable = true,
        lookahead = true,
        select = {
          enable = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ak'] = '@block.outer',
            ['ik'] = '@block.inner',
          },
        },
      },
    }
  end,

  cond = vim.fn.exists 'g:vscode' == 0,
}
