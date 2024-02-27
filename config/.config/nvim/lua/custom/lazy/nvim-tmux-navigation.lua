return {
  'alexghergh/nvim-tmux-navigation',
  config = function()
    require'nvim-tmux-navigation'.setup {
      disable_when_zoomed = true, -- defaults to false
      keybindings = {
        left = "<C-j>h",
        down = "<C-j>j",
        up = "<C-j>k",
        right = "<C-j>l",
      }
    }

    local ntn = require'nvim-tmux-navigation'
    vim.keymap.set('i', "<C-j>h", ntn.NvimTmuxNavigateLeft)
    vim.keymap.set('i', "<C-j>j", ntn.NvimTmuxNavigateDown)
    vim.keymap.set('i', "<C-j>k", ntn.NvimTmuxNavigateUp)
    vim.keymap.set('i', "<C-j>l", ntn.NvimTmuxNavigateRight)

    vim.keymap.set('c', "<C-j>h", ntn.NvimTmuxNavigateLeft)
    vim.keymap.set('c', "<C-j>j", ntn.NvimTmuxNavigateDown)
    vim.keymap.set('c', "<C-j>k", ntn.NvimTmuxNavigateUp)
    vim.keymap.set('c', "<C-j>l", ntn.NvimTmuxNavigateRight)
  end
}
