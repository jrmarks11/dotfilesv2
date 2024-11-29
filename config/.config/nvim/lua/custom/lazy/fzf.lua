return {
  'ibhagwan/fzf-lua',
  event = 'VeryLazy',

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

    local function map(mode, key, command, description)
      vim.keymap.set(mode, key, command, { silent = true, desc = description })
    end

    map({ 'n', 'x' }, '<space>b', [[<cmd>lua require('util.branch_files').branch_files()<cr>]], 'Branch Files')
    map('n', '<space>f', [[<cmd>lua require('fzf-lua').grep_cword()<CR>]], 'Search Find Word')
    map('x', '<space>f', [[<cmd>lua require('fzf-lua').grep_visual()<CR>]], 'Search Find Visual')
    map({ 'n', 'x' }, '<space>g', [[<cmd>lua require('fzf-lua').git_status()<CR>]], 'Git Status')
    map({ 'n', 'x' }, '<space>i', [[<cmd>lua require('fzf-lua').grep_curbuf()<CR>]], 'Search Current Buffer')
    map({ 'n', 'x' }, '<space>j', [[<cmd>lua require('fzf-lua').grep({no_esc = true})<CR>]], 'Search Grep Project')
    map({ 'n', 'x' }, '<space>u', [[<cmd>lua require('fzf-lua').resume()<CR>]], 'Resume Fzf Search')
  end,
}
