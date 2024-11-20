return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  lazy = false,
  version = false,
  opts = {
    provider = 'openai',
    openai = {
      model = 'gpt-4o',
    },
    mappings = {
      ask = ',a',
      edit = ',c',
      refresh = ',r',
    },
  },
  keys = {
    {
      ',a',
      function()
        require('avante.api').ask()
      end,
      desc = 'avante: ask',
      mode = { 'n', 'v' },
    },
    {
      ',r',
      function()
        require('avante.api').refresh()
      end,
      desc = 'avante: refresh',
    },
    {
      ',e',
      function()
        require('avante.api').edit()
        vim.cmd [[startinsert]]
      end,
      desc = 'avante: edit',
      mode = 'v',
    },
  },
  build = 'make',
  dependencies = {
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
  },
}