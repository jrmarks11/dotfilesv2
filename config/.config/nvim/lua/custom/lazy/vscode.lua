if not vim.g.vscode then
  return {}
end

vim.g.snacks_animate = false

return {
  {
    'folke/snacks.nvim',
    opts = {
      bigfile = { enabled = false },
      input = { enabled = false },
      notifier = { enabled = false },
      statuscolumn = { enabled = false },
      picker = { enabled = false },
      quickfile = { enabled = false },
      scroll = { enabled = false },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { highlight = { enable = false } },
  },
}
