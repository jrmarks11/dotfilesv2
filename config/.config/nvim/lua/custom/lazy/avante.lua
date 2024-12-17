local function ensure_sidebar_and_execute()
  local avante = require 'avante'
  local sidebar = avante.get()

  if not sidebar then
    require('avante')._init(vim.api.nvim_get_current_tabpage())
  end

  return require 'avante.api'
end

return {
  'yetone/avante.nvim',
  build = 'make',
  version = false,
  keys = {
    {
      ',aa',
      function()
        ensure_sidebar_and_execute().ask()
      end,
      desc = 'Avante: Ask',
      mode = { 'n', 'v' },
    },
    {
      ',ae',
      function()
        ensure_sidebar_and_execute().edit()
      end,
      desc = 'Avante: Edit',
      mode = 'v',
    },
    {
      ',af',
      function()
        ensure_sidebar_and_execute().focus()
      end,
      desc = 'Avante: Focus',
      mode = { 'n', 'v' },
    },
    {
      ',ar',
      function()
        ensure_sidebar_and_execute().refresh()
      end,
      desc = 'Avante: Refresh',
    },
  },
  dependencies = {
    'zbirenbaum/copilot.lua',
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    {
      'HakonHarnes/img-clip.nvim',
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
  },

  opts = {
    provider = 'copilot',
    mappings = { ask = ',aa', edit = ',ae', refresh = ',ar', focus = ',af' },
    hints = { enabled = false },
  },

  cond = vim.fn.exists 'g:vscode' == 0,
}
