local o = vim.opt
local undo_dir = vim.fn.expand '$HOME' .. '/.nvim-undo'

vim.diagnostic.config({ jump = { float = true } })

o.clipboard:append 'unnamedplus'
o.colorcolumn = { 81, 82 }
o.cursorline = true
o.expandtab = true
o.ignorecase = true
o.list = true
o.listchars = { tab = '▸ ', trail = '·', nbsp = '␣' }
o.number = true
o.pumheight = 15
o.relativenumber = true
o.scrolljump = 8
o.scrolloff = 2
o.shada = { "'300", '<50', 's10', 'h' }
o.shiftround = true
o.shiftwidth = 2
o.showmatch = true
o.showmode = false
o.signcolumn = 'yes'
o.smartcase = true
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.tabstop = 2
o.textwidth = 78
o.updatetime = 250
o.undodir = undo_dir
o.undofile = true
o.visualbell = true
o.wildmenu = true
o.wildmode = 'longest:full,full'

if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.system('mkdir -p ' .. undo_dir)
end
