return {
  {
    'echasnovski/mini.ai',
    version = false,
    event = 'VeryLazy',

    dependencies = {
      'echasnovski/mini.extra',
      lazy = true,
      config = function()
        require('mini.extra').setup {}
      end,
    },

    config = function()
      local gen_spec = require('mini.ai').gen_spec
      local gen_extra_spec = require('mini.extra').gen_ai_spec

      require('mini.ai').setup {
        n_lines = 500,
        custom_textobjects = {
          c = gen_spec.treesitter { a = '@comment.outer', i = '@comment.outer' },
          d = gen_extra_spec.number(),
          e = gen_extra_spec.buffer(),
          f = gen_spec.treesitter { a = '@function.outer', i = '@function.inner' },
          i = gen_extra_spec.indent(),
          l = gen_extra_spec.line(),
          o = gen_spec.treesitter({
            a = { '@block.outer', '@conditional.outer', '@loop.outer' },
            i = { '@block.inner', '@conditional.inner', '@loop.inner' },
          }, {}),
        },
        mappings = {
          around_next = '',
          inside_next = '',
          around_last = '',
          inside_last = '',
          goto_left = '',
          goto_right = '',
        },
      }
    end,
  },
  {
    'echasnovski/mini.icons',
    version = false,
    lazy = true,
    opts = {},
  },
  {
    'echasnovski/mini.surround',
    version = false,
    keys = {
      { 'sa', mode = { 'n', 'x' } },
      { 'sd', mode = { 'n', 'x' } },
      { 'sr', mode = { 'n', 'x' } },
    },

    opts = {
      mappings = { find = '', find_left = '', highlight = '', update_n_lines = '', suffix_last = '', suffix_next = '' },
    },
  },
  {
    'echasnovski/mini.splitjoin',
    version = false,
    keys = { 'ss' },
    opts = { mappings = { toggle = 'ss' } },
  },
  {
    'echasnovski/mini.statusline',
    version = false,
    event = 'VeryLazy',

    config = function()
      local sl = require 'util.statusline'
      require('mini.statusline').setup {
        content = { active = sl.active, inactive = sl.inactive },
      }
    end,

    cond = vim.fn.exists 'g:vscode' == 0,
  },
  {
    'echasnovski/mini.visits',
    version = false,
    event = 'VeryLazy',

    config = function()
      require('mini.visits').setup()

      vim.keymap.set(
        { 'n', 'x' },
        '<space>t',
        '<Cmd>lua require("util.visits").frecency_list()<CR>',
        { desc = 'Frecent Files' }
      )
    end,

    cond = vim.fn.exists 'g:vscode' == 0,
  },
}
