return {
  'alexghergh/nvim-tmux-navigation',
  lazy = false,

  config = function()
    require 'nvim-tmux-navigation'.setup {
      disable_when_zoomed = true,
    }

    local ntn = require 'nvim-tmux-navigation'
    local map = vim.keymap.set
    map({ 'n', 'i', 'c', 'x', 't' }, '<C-j>h', ntn.NvimTmuxNavigateLeft)
    map({ 'n', 'i', 'c', 'x', 't' }, '<C-j>j', ntn.NvimTmuxNavigateDown)
    map({ 'n', 'i', 'c', 'x', 't' }, '<C-j>k', ntn.NvimTmuxNavigateUp)
    map({ 'n', 'i', 'c', 'x', 't' }, '<C-j>l', ntn.NvimTmuxNavigateRight)
  end,

  cond = vim.fn.exists('g:vscode') == 0
}
