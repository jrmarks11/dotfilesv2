return {
  'chaoren/vim-wordmotion',
  event = 'VeryLazy',

  init = function()
    local function map(key, cmd, desc)
      vim.keymap.set({ 'n', 'x', 'o' }, key, cmd, { remap = true, desc = desc })
    end

    vim.g.wordmotion_nomap = 1

    map(',w', '<Plug>WordMotion_w', 'Word Motion w')
    map(',b', '<Plug>WordMotion_b', 'Word Motion b')
    map(',e', '<Plug>WordMotion_e', 'Word Motion e')
  end,
}
