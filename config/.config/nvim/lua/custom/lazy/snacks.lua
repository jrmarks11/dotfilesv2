return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,

  opts = {
    bigfile = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    quickfile = { enabled = true },

    picker = {
      hidden = true,
      layout = { preset = "sidebar" },
      win = {
        input = {
          keys = {
            ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
            ['<c-d>'] = { 'preview_scroll_down', mode = { 'i', 'n' } },
            ['<c-u>'] = { 'preview_scroll_up', mode = { 'i', 'n' } },
            ['<c-h>'] = { 'toggle_help', mode = { 'i', 'n' } },
          },
        },
      },
    },
  },

  keys = {
    { ',n', '<cmd>lua Snacks.picker.notifications()<cr>', desc = 'Notifications', mode = { 'n', 'x' } },
    { ',u', '<cmd>lua Snacks.picker.undo()<cr>', desc = 'Undo List', mode = { 'n', 'x' } },
    { ',.', '<cmd>lua Snacks.scratch()<cr>', desc = 'Toggle Scratch Buffer', mode = { 'n', 'x' } },
    { ',>', '<cmd>lua Snacks.scratch.select()<cr>', desc = 'Select Scratch Buffer', mode = { 'n', 'x' } },
    { 'sL', '<cmd>lua Snacks.gitbrowse()<cr>', desc = 'Git Browse (open)', mode = { 'n', 'x' } },
    {
      'sl',
      function()
        Snacks.gitbrowse {
          open = function(url)
            vim.fn.setreg('+', url)
          end,
          notify = false,
        }
      end,
      desc = 'Git Browse (copy)',
      mode = { 'n', 'x' },
    },
  },
}
