return {
  "folke/which-key.nvim",
  event = { "VeryLazy" },

  opts = {
    triggers = {
      { "<auto>", mode = "nixsotc" },
      { "s", mode = { "n", "v" } },
    },
    icons = {
      rules = {
        { pattern = "flash", icon = " ", color = "red" },
        { pattern = "case", icon = " ", color = "red" },
        { pattern = "go", icon = " ", color = "blue" },
        { pattern = "paste", icon = " ", color = "green" },
        { pattern = "substitute", icon = " ", color = "yellow" },
        { pattern = "surround", icon = " ", color = "purple" },
        { pattern = "word", icon = " ", color = "cyan" },
      },
    },
    spec = {
      { "<space><tab>", desc = "Go to last buffer" },
      { "<space>b", desc = "Branch Files" },
      { "<space>d", desc = "Files in CWD" },
      { "<space>f", desc = "Grep word" },
      { "<space>g", desc = "Git Status" },
      { "<space>u", desc = "Resume Last Picker" },
      { "sa", desc = "Surround Add" },
      { "sd", desc = "Surround Delete" },
      { "sr", desc = "Surround Replace" },
      { "ss", desc = "Split Toggle" },
      { "<BS>", desc = "Decrement Selection", mode = "x" },
      { "<CR>", desc = "Increment Selection", mode = { "x", "n" } },
      { "<TAB>", desc = "Increment Scope", mode = "x" },
    },
  },
}
