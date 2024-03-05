return {
  'alexghergh/nvim-tmux-navigation',
  config = function()
    require'nvim-tmux-navigation'.setup {
      disable_when_zoomed = true, -- defaults to false
    }

    local ntn = require'nvim-tmux-navigation'
    local map = vim.keymap.set

    map({ 'n', 'i', 'c', 'x' }, '<C-j>h', ntn.NvimTmuxNavigateLeft)
    map({ 'n', 'i', 'c', 'x' }, '<C-j>j', ntn.NvimTmuxNavigateDown)
    map({ 'n', 'i', 'c', 'x' }, '<C-j>k', ntn.NvimTmuxNavigateUp)
    map({ 'n', 'i', 'c', 'x' }, '<C-j>l', ntn.NvimTmuxNavigateRight)
  end,
  cond = vim.fn.exists('g:vscode') == 0
}
