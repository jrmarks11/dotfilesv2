return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {}

    require("which-key").register({
      ["s"] = { name = "Mappings for 's'" },
      [","] = { name = "Mappings for comma" },
      ["<space>"] = { name = "Mappings for space" }
    }, { mode = "n" })   -- Adjust the mode according to your needs
  end,

  cond = vim.fn.exists('g:vscode') == 0
}
