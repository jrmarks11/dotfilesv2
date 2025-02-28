return {
  "stevearc/conform.nvim",
  keys = {
    {
      ",,",
      function()
        local conform = require("conform")
        conform.format({ async = true, lsp_fallback = true, timeout_ms = 8000 })
      end,
      desc = "Format buffer",
      silent = true,
    },
  },

  opts = function()
    return {
      formatters = {
        mix = {
          command = "mix",
          args = { "format", "--stdin-filename", "$FILENAME", "-" },
          cwd = require("conform.util").root_file({ "mix.exs" }),
        },
        sqlfluff = {
          command = "sh",
          args = { "-c", "sqlfluff fix --dialect=postgres - || true" },
          stdin = true,
          require_cwd = false,
        },
      },

      formatters_by_ft = {
        css = { "prettier" },
        elixir = { "mix" },
        eruby = { "erb_format" },
        graphql = { "prettier" },
        html = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier" },
        python = { "black" },
        ruby = { "rubocop" },
        scss = { "prettier" },
        sh = { "beautysh" },
        sql = { "sqlfluff" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        yaml = { "prettier" },
        vue = { "prettier" },
        xml = { "xmllint" },
        zsh = { "beautysh" },
      },
    }
  end,
}
