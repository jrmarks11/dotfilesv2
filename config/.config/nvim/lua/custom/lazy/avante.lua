local keys = {
  {
    ',aa',
    function()
      require('avante.api').ask()
    end,
    desc = 'Avante: Ask',
    mode = { 'n', 'v' },
  },
  {
    ',ar',
    function()
      require('avante.api').refresh()
    end,
    desc = 'Avante: Refresh',
  },
  {
    ',ae',
    function()
      require('avante.api').edit()
      vim.cmd [[startinsert]]
    end,
    desc = 'Avante: Edit',
    mode = 'v',
  },
}

local dependencies = {
  "zbirenbaum/copilot.lua",
  'nvim-treesitter/nvim-treesitter',
  'stevearc/dressing.nvim',
  'nvim-lua/plenary.nvim',
  'MunifTanjim/nui.nvim',
  {
    'HakonHarnes/img-clip.nvim',
    event = 'VeryLazy',
    opts = {
      default = {
        embed_image_as_base64 = false,
        prompt_for_file_name = false,
        drag_and_drop = {
          insert_mode = true,
        },
        use_absolute_path = true,
      },
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      file_types = { 'markdown', 'Avante' },
    },
    ft = { 'markdown', 'Avante' },
  },
}

local opts = {
  provider = 'copilot',
  mappings = { ask = ',aa', edit = ',ae', refresh = ',ar', },
  hints = { enabled = false, },
}

return {
  'yetone/avante.nvim',
  keys = keys,
  dependencies = dependencies,
  version = false,
  opts = opts,
  build = 'make',
  cond = vim.fn.exists 'g:vscode' == 0,
}
