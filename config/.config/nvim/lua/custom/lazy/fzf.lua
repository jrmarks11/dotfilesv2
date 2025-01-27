return {
  'ibhagwan/fzf-lua',
  dependencies = { { 'echasnovski/mini.icons' } },

  keys = {
    {
      '<space>b',
      function()
        require('util.branch_files').branch_files()
      end,
      desc = 'Branch Files',
      mode = { 'n', 'x' },
    },
    { '<space>c', '<cmd>FzfLua git_bcommits<CR>', desc = 'Search Git Commits', mode = { 'n', 'x' } },
    {
      '<space>d',
      "<cmd>lua require('fzf-lua').files({cwd = '%:h'})<CR>",
      desc = 'Fzf Files CWD',
      mode = { 'n', 'x' },
    },
    { '<space>f', '<cmd>FzfLua grep_cword<CR>', desc = 'Search Find Word' },
    { '<space>f', '<cmd>FzfLua grep_visual<CR>', desc = 'Search Find Visual', mode = 'x' },
    { '<space>g', '<cmd>FzfLua git_status<CR>', desc = 'Git Status', mode = { 'n', 'x' } },
    { '<space>i', '<cmd>FzfLua grep_curbuf<CR>', desc = 'Search Current Buffer', mode = { 'n', 'x' } },
    { '<space>j', '<cmd>FzfLua grep<CR>', desc = 'Search Grep Project', mode = { 'n', 'x' } },
    { '<space>r', '<cmd>FzfLua oldfiles<CR>', desc = 'Recent Files', mode = { 'n', 'x' } },
    { '<space>u', '<cmd>FzfLua resume<CR>', desc = 'Resume Fzf Search', mode = { 'n', 'x' } },
  },
  cmd = 'FzfLua',

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

      oldfiles = {
        include_current_session = true,
        cwd_only = true,
      },

      grep = {
        rg_opts = '--column --line-number --no-heading --color=always --smart-case --hidden',
      },

      grep_curbuf = {
        previewer = false,
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
