return {
  "neovim/nvim-lspconfig",

  opts = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    keys[#keys + 1] = { "<space>cl", false }
    keys[#keys + 1] = { "<space>ca", false, mode = { "n", "v" } }
    keys[#keys + 1] = { "<space>cc", false, mode = { "n", "v" } }
    keys[#keys + 1] = { "<space>cC", false }
    keys[#keys + 1] = { "<space>cR", false }
    keys[#keys + 1] = { "<space>cr", false }
    keys[#keys + 1] = { "<space>cA", false }
    keys[#keys + 1] = { "<a-n>", false }
    keys[#keys + 1] = { "<a-p>", false }
    keys[#keys + 1] = { "<space>ss", false }
    keys[#keys + 1] = { "<space>sS", false }
    keys[#keys + 1] = { "K", false }
    keys[#keys + 1] = {
      "<c-k>",
      function()
        return vim.lsp.buf.hover()
      end,
    }
  end,
}
