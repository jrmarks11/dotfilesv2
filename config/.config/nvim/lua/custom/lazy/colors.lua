return {
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
          style = "light",
          transparent = false,
          terminal_colors = false,
          styles = {
            comments = { italic = false },
            keywords = { italic = false },
            sidebars = "light",
            floats = "light",
          },
        })
        vim.o.background = "light"
        vim.cmd.colorscheme("tokyonight")
    end
  },
}
