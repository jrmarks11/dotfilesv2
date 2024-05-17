local opt = vim.opt
local undo_dir = vim.fn.expand('$HOME') .. '/.nvim-undo'

opt.clipboard:append('unnamed')
opt.colorcolumn = { 81, 82 }
opt.expandtab = true
opt.ignorecase = true
opt.list = true
opt.listchars = { tab = '▸ ', trail = '·', nbsp = '␣' }
opt.number = true
opt.pumheight = 15
opt.relativenumber = true
opt.scrolljump = 8
opt.scrolloff = 1
opt.shada = { "'300", '<50', 's10', 'h' }
opt.shiftround = true
opt.shiftwidth = 2
opt.showmatch = true
opt.sidescrolloff = 5
opt.signcolumn = 'yes'
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.textwidth = 78
opt.undodir = undo_dir
opt.undofile = true
opt.undolevels = 1000
opt.undoreload = 10000
opt.visualbell = true
opt.wildmenu = true
opt.wildmode = 'longest:full,full'

vim.g.mapleader = " "

if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.system('mkdir -p ' .. undo_dir)
end
