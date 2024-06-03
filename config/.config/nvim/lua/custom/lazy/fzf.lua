return {
  'ibhagwan/fzf-lua',
  event = 'VeryLazy',
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    local fzf = require 'fzf-lua'
    fzf.setup {
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

    require 'custom.keybindings.fzf'
  end,

  cond = vim.fn.exists 'g:vscode' == 0,
}
