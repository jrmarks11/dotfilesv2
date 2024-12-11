return {
  'ibhagwan/fzf-lua',
  keys = {
    {
      '<space>B',
      function()
        require('util.branch_files').branch_files()
      end,
      desc = 'Branch Files',
      mode = { 'n', 'x' },
    },
    { '<space>F', '<cmd>FzfLua grep_cword<CR>', desc = 'Search Find Word', mode = 'n' },
    { '<space>F', '<cmd>FzfLua grep_visual<CR>', desc = 'Search Find Visual', mode = 'x' },
    { '<space>G', '<cmd>FzfLua git_status<CR>', desc = 'Git Status', mode = { 'n', 'x' } },
    { '<space>I', '<cmd>FzfLua grep_curbuf<CR>', desc = 'Search Current Buffer', mode = { 'n', 'x' } },
    { '<space>J', '<cmd>FzfLua grep<CR>', desc = 'Search Grep Project', mode = { 'n', 'x' } },
    { '<space>U', '<cmd>FzfLua resume<CR>', desc = 'Resume Fzf Search', mode = { 'n', 'x' } },
  },

  config = function()
    local fzf = require 'fzf-lua'
    fzf.setup {
      defaults = {
        file_icons = 'mini',
      },

      winopts = {
        preview = {
          vertical = 'up:60%',
          layout = 'vertical',
        },
      },

      grep = {
        rg_opts = '--column --line-number --no-heading --color=always --smart-case --hidden',
      },

      keymap = {
        builtin = {
          ['<c-h>'] = 'toggle-help',
          ['<c-d>'] = 'preview-page-down',
          ['<c-u>'] = 'preview-page-up',
        },
        fzf = {
          ['ctrl-q'] = 'select-all+accept',
          ['ctrl-d'] = 'preview-page-down',
          ['ctrl-u'] = 'preview-page-up',
        },
      },
    }

    fzf.register_ui_select()
  end,

  cond = vim.fn.exists 'g:vscode' == 0,
}
