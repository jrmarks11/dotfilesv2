return {
  {
    'echasnovski/mini.ai',
    version = false,
    event = 'VeryLazy',

    config = function()
      require('mini.ai').setup {
        n_lines = 500,
        custom_textobjects = {
          o = require('mini.ai').gen_spec.treesitter {
            a = { '@block.outer', '@conditional.outer', '@loop.outer' },
            i = { '@block.inner', '@conditional.inner', '@loop.inner' },
          },
          f = require('mini.ai').gen_spec.treesitter {
            a = '@function.outer',
            i = '@function.inner',
          },
          t = {
            '<([%p%w]-)%f[^<%w][^<>]->.-</%1>',
            '^<.->().*()</[^/]->$',
          },
          d = { '%f[%d]%d+' },
          c = {
            { '%u[%l%d]+%f[^%l%d]', '%f[%S][%l%d]+%f[^%l%d]', '%f[%P][%l%d]+%f[^%l%d]', '^[%l%d]+%f[^%l%d]' },
            '^().*()$',
          },
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
    'echasnovski/mini.indentscope',
    version = false,
    event = { 'BufReadPost', 'BufNewFile' },

    config = function()
      require('mini.indentscope').setup {
        draw = { animation = require('mini.indentscope').gen_animation.none() },
        options = { indent_at_cursor = false },
      }
    end,
  },
  {
    'echasnovski/mini.icons',
    version = false,
    lazy = true,
    config = function()
      require('mini.icons').setup {}
    end,
  },
  {
    'echasnovski/mini.surround',
    version = false,
    keys = {
      { 'sa', mode = { 'n', 'x' } },
      { 'sd', mode = { 'n', 'x' } },
      { 'sr', mode = { 'n', 'x' } },
    },

    config = function()
      require('mini.surround').setup {
        mappings = {
          find = '',
          find_left = '',
          highlight = '',
          update_n_lines = '',
          suffix_last = '',
          suffix_next = '',
        },
      }
    end,
  },
  {
    'echasnovski/mini.splitjoin',
    version = false,
    keys = { 'ss' },

    config = function()
      require('mini.splitjoin').setup {
        mappings = { toggle = 'ss' },
      }
    end,
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
