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
        { pattern = "case", icon = " ", color = "red" },
        { pattern = "go", icon = " ", color = "blue" },
        { pattern = "paste", icon = " ", color = "green" },
        { pattern = "substitute", icon = " ", color = "yellow" },
        { pattern = "surround", icon = " ", color = "purple" },
        { pattern = "switch", icon = " ", color = "orange" },
        { pattern = "word", icon = " ", color = "cyan" },
      },
    },
    spec = {
      mode = { "n", "v" },
      { "gx", desc = "Open with system app" },
      { "sa", desc = "Surround Add" },
      { "sd", desc = "Surround Delete" },
      { "sr", desc = "Surround Replace" },
      { "ss", desc = "Split Toggle" },
    },
  },
}
