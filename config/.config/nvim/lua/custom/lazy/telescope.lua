return {
  {
    'nvim-telescope/telescope.nvim',
    tag = "0.1.5",

    dependencies = {
      'nvim-lua/plenary.nvim',
      'smartpde/telescope-recent-files',
      'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
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
          },
          extensions = {
            recent_files = {
              only_cwd = true,
            },
          },
          pickers = {
            find_files = {
              find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
            },
          },
        })

      telescope.load_extension("fzf")
      telescope.load_extension("recent_files")

      map("n", "<Space>d", function() builtin.find_files({ cwd = "%:h" }) end)

      map('n', '<Space>f', function()
        local word = vim.fn.expand("<cword>")
        builtin.grep_string({ search = word })
      end)

      map('n', '<Space>h', function()
	local word = vim.fn.expand("<cword>")
	builtin.help_tags({ default_text = word })
      end)

      map("n", "<Space>i", builtin.highlights)
      map("n", "<Space>j", function()
        builtin.grep_string({ search = vim.fn.input("grep ❯ ") })
      end)

      local recent_files = require('telescope').extensions.recent_files
      map("n", "<Space>r", function()recent_files.pick()end)

      map('n', '<Space>t', builtin.find_files)
      map("n", "<Space>g", builtin.git_status)

    end
  }
}
