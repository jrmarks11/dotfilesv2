return {
  "cbochs/grapple.nvim",
  opts = {
    scope = "cwd",
  },
  event = { "BufReadPost", "BufNewFile" },
  cmd = "Grapple",
  keys = {
    { "sm", "<cmd>Grapple toggle<cr>",          desc = "Grapple toggle tag" },
    { "<space>m", "<cmd>Grapple toggle_tags<cr>",     desc = "Grapple open tags window" },
    { "sn", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
    { "sp", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
  },
}
