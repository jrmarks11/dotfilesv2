return {
  "lewis6991/gitsigns.nvim",

  opts = {
    on_attach = function()
      local gs = package.loaded.gitsigns
      local map = vim.keymap.set
      local cmd = vim.cmd

      map("n", "]c", function()
        gs.next_hunk()
        cmd("normal! zz")
      end, { desc = "Next Git Change" })

      map("n", "[c", function()
        gs.prev_hunk()
        cmd("normal! zz")
      end, { desc = "Previous Git Change" })

      map("n", "sb", function()
        gs.blame_line({ full = true })
      end, { desc = "Git Blame" })

      map("n", "sB", function()
        gs.blame()
      end, { desc = "Blame Buffer" })

      map("n", "sg", gs.stage_hunk, { desc = "Git Stage Hunk" })
      map("n", "sv", gs.preview_hunk, { desc = "Git Preview Hunk" })
      map("n", "su", gs.reset_hunk, { desc = "Git Undo Hunk" })
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "GitSigns Select Hunk" })
    end,
  },
}
