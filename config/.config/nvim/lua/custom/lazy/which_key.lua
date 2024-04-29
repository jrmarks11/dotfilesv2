return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {}
  end,

  cond = vim.fn.exists('g:vscode') == 0
}
