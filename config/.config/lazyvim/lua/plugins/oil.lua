return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  dependencies = { { "echasnovski/mini.icons" } },
  keys = { { "-", "<CMD>Oil<CR>", { desc = "Open parent directory file" } } },

  opts = {
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name)
        return name == ".."
      end,
    },
  },
}
