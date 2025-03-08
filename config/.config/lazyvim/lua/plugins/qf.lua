return {
  "romainl/vim-qf",
  event = "VeryLazy",

  keys = {
    { "[q", [[<Plug>(qf_qf_previous)]], desc = "Go To Previous Quickfix" },
    { "]q", [[<Plug>(qf_qf_next)]], desc = "Go To Next Quickfix" },
    { ",q", [[<Plug>(qf_qf_toggle)]], desc = "Toggle Quickfix" },
    { "[l", [[<Plug>(qf_loc_previous)]], desc = "Go To Previous Location List" },
    { "]l", [[<Plug>(qf_loc_next)]], desc = "Go To Next Location List" },
    { ",l", [[<Plug>(qf_loc_toggle)]], desc = "Toggle Location List" },
  },
}
