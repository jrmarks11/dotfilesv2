return {
  'lewis6991/gitsigns.nvim',
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function ()
    if vim.opt.diff:get() then
      return
    end

    local gitsigns = require("gitsigns")
    local feedkeys = vim.api.nvim_feedkeys
    local map = vim.keymap.set
    local schedule = vim.schedule

    gitsigns.setup({
      signs = {
        add = { hl = "GitSignsAdd", text = "┃" },
        change = { hl = "GitSignsChange", text = "┃" },
        delete = { hl = "GitSignsDelete", text = "▁" },
        topdelete = { hl = "GitSignsDelete", text = "▔" },
        changedelete = { hl = "GitSignsChangeDelete", text = "┃" },
        untracked = { hl = "GitSignsUntracked", text = "┃" },
      },
        on_attach = function()
          local gs = package.loaded.gitsigns

          map("n", "]c", function()
            gs.next_hunk()
            schedule(function()
              feedkeys("zz", "n", false)
            end)
          end)

          map("n", "[c", function()
            gs.prev_hunk()
            schedule(function()
              feedkeys("zz", "n", false)
            end)
          end)

          map("n", "sh", gs.stage_hunk)
          map("n", "su", gs.reset_hunk)
          map("n", "sp", gs.preview_hunk)
          map("n", "sb", function()
            gs.blame_line({ full = true })
          end)
        end,
        max_file_length = 100000,
        sign_priority = 6,
      })
  end
}
