return {
  "mfussenegger/nvim-lint",
  ft = { "elixir", "markdown", "sql", "yaml" },

  opts = {
    linters_by_ft = {
      elixir = { "credo" },
      yaml = { "yamllint" },
      markdown = { "markdownlint" },
      sql = { "sqlfluff" },
    },

    linters = {
      credo = {
        args = { "credo", "list", "--format=oneline", "--read-from-stdin" },
      },
      sqlfluff = {
        args = { "lint", "--format=json", "--dialect=postgres" },
      },
    },
  },
}
