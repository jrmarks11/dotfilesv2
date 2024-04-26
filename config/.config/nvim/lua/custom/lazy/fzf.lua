return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    require('fzf-lua').setup {
      winopts = {
        preview = {
          vertical = 'up:60%',
          layout = 'vertical',
        },
      },
      keymap = {
        builtin = {
          ["<c-h>"]        = "toggle-help",
          ["<c-d>"]    = "preview-page-down",
          ["<c-u>"]      = "preview-page-up",
        },
        fzf = {
          ["ctrl-q"]       = "toggle-all",
        },
      },
    }

    require('custom.keybindings.fzf')
  end,

  cond = vim.fn.exists("g:vscode") == 0,
}
