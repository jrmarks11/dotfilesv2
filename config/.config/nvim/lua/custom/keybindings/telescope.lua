local telescope = require 'telescope'
local map = vim.keymap.set
local builtin = require 'telescope.builtin'

map('n', '<Space>b', builtin.buffers, { desc = '[B]uffers' })

map('n', '<Space>d', function()
  builtin.find_files { cwd = '%:h' }
end, { desc = 'Find in CW[D]' })

map('n', '<Space>g', builtin.git_status, { desc = '[G]it Status Files' })

map('n', '<Space>r', function()
  telescope.extensions.recent_files.pick()
end, { desc = '[R]ecent files' })
map('n', '<Space>t', builtin.find_files, { desc = '[T]o Files' })

map('n', '<Space>f', function()
  local word = vim.fn.expand '<cword>'
  builtin.grep_string { search = word }
end, { desc = '[F]ind Word' })

map('x', '<Space>f', function()
  vim.cmd 'normal! y'
  local visual_text = vim.fn.getreg ''
  builtin.grep_string { search = visual_text }
end, { desc = '[F]ind Visual Selection' })

map('n', '<Space>h', builtin.help_tags, { desc = '[H]elp' })

map('n', '<Space>j', function()
  builtin.grep_string { search = vim.fn.input 'grep ❯ ' }
end, { desc = 'Find in Pro[j]ect' })

map('n', '<Space>u', function()
  builtin.resume()
end, { desc = 'Res[u]me' })
