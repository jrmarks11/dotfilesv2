return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = "0.1.5",

    dependencies = {
      'nvim-lua/plenary.nvim',
    },

    config = function()
      local telescope = require("telescope")
      local builtin = require('telescope.builtin')
      local map = vim.keymap.set

      telescope.setup({
          defaults = {
            layout_strategy = 'vertical',
            layout_config = {
              preview_cutoff = 40,
              vertical = { width = 0.9, height = 0.9, preview_height = 0.6 },
            },
          }
        })
      telescope.load_extension("fzf")

      local tutil = require('util.telescope-commands')

      map("n", "<Space>d", function() builtin.find_files({ cwd = "%:h" }) end)
      map('n', '<Space>f', function()
        local word = vim.fn.expand("<cword>")
        builtin.grep_string({ search = word })
      end)
      map("n", "<Space>h", builtin.help_tags)
      map("n", "<Space>i", builtin.highlights)
      map("n", "<Space>j", function()
        builtin.grep_string({ search = vim.fn.input("grep ❯ ") })
      end)
      map("n", "<Space>r", tutil.git_recent_files)
      map('n', '<Space>t', builtin.find_files)
      map("n", "<Space>g", builtin.git_status)

    end
  }
}
