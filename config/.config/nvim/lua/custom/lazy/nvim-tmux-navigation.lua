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
    local map = vim.keymap.set

    map('i', "<C-j>h", ntn.NvimTmuxNavigateLeft)
    map('i', "<C-j>j", ntn.NvimTmuxNavigateDown)
    map('i', "<C-j>k", ntn.NvimTmuxNavigateUp)
    map('i', "<C-j>l", ntn.NvimTmuxNavigateRight)

    map('c', "<C-j>h", ntn.NvimTmuxNavigateLeft)
    map('c', "<C-j>j", ntn.NvimTmuxNavigateDown)
    map('c', "<C-j>k", ntn.NvimTmuxNavigateUp)
    map('c', "<C-j>l", ntn.NvimTmuxNavigateRight)
  end
}
