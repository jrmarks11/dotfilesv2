return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "vimdoc", "javascript", "typescript", "lua", "bash", "css", "elixir",
        "html", "json", "markdown", "regex", "ruby", "tsx", "yaml", "vue"
      },

      auto_install = true,
      indent = { enable = true },
      highlight = { enable = true }
    })
  end
}