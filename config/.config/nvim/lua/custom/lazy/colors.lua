return {
  'catppuccin/nvim',
  lazy = false,
  name = 'catppuccin',
  priority = 1000,

  opts = {
    integrations = {
      mason = true,
      which_key = true,
    },
    custom_highlights = function(colors)
      return {
        MiniJump = {
          fg = colors.green,
          bg = colors.none,
          style = { 'bold', 'underline' },
          nocombine = true
        },
      }
    end,
  },

  init = function()
    vim.g.catppuccin_flavour = 'latte'
  end,
}
