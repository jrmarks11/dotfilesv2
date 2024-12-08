return {
  'chaoren/vim-wordmotion',

  keys = {
    { ',w', '<Plug>WordMotion_w', desc = 'Word Motion w', mode = { 'n', 'x', 'o' } },
    { ',b', '<Plug>WordMotion_b', desc = 'Word Motion b', mode = { 'n', 'x', 'o' } },
    { ',e', '<Plug>WordMotion_e', desc = 'Word Motion e', mode = { 'n', 'x', 'o' } },
  },

  init = function()
    vim.g.wordmotion_nomap = 1
  end,
}
