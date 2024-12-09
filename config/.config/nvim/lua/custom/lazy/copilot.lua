return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",

    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          panel = { enabled = false },

          keymap = {
            accept = "<tab>",
            accept_word = "<M-Right>",
            accept_line = "<C-E>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
      })
    end,

    cond = vim.fn.exists 'g:vscode' == 0,
  }
}
