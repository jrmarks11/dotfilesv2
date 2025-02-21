return {
  {
    "echasnovski/mini.surround",
    version = false,
    keys = {
      { "sa", mode = { "n", "x" } },
      { "sd", mode = { "n", "x" } },
      { "sr", mode = { "n", "x" } },
    },

    opts = {
      mappings = { find = "", find_left = "", highlight = "", update_n_lines = "", suffix_last = "", suffix_next = "" },
    },
  },
  {
    "echasnovski/mini.splitjoin",
    version = false,
    keys = { "ss" },
    opts = { mappings = { toggle = "ss" } },
  },
  {
    "echasnovski/mini.statusline",
    version = false,
    event = "VeryLazy",
    opts = {},
  },
}
