-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("c", "<C-n>", "<down>")
map("c", "<C-p>", "<up>")
map("c", "<C-a>", "<home>")
map("c", "<C-e>", "<end>")
map("c", "<M-Left>", "<s-left>")
map("c", "<M-Right>", "<s-right>")
map("c", "<esc><bs>", "<c-w>")
map("c", "<C-k>", "<c-\\>e strpart(getcmdline(),0,getcmdpos()-1)<cr>")

map("n", "sp", [[:'{,'}s/\<<c-r><c-w>\>//g<left><left>]], { desc = "Substitute in Paragraph" })
map("x", "sp", [[y:'{,'}s/<c-r><c-0>//g<left><left>]], { desc = "Substitute in Paragraph" })
map("n", "se", [[:%s/\<<c-r><c-w>\>//g<left><left>]], { desc = "Substitute In Entire Buffer" })
map("x", "se", "y:%s/<c-r><c-0>//g<left><left>", { desc = "Substitute In Entire Buffer" })

map("n", "gp", "mz<cmd>put<CR>`zj<cmd>delmarks z<cr>", { desc = "Paste on next line" })
map("n", "gP", "mz<cmd>put!<CR>`zk<cmd>delmarks z<cr>", { desc = "Paste on previous line" })

map("n", "<space>e", ":e <cfile><CR>", { desc = "Edit File Under Cursor" })

map({ "n", "x" }, ",", "<nop>")
map({ "n", "x" }, "s", "<nop>")

map("n", "J", "mzJ`z<cmd>delmarks z<cr>", { silent = true })
map("n", "K", "i<cr><esc>^mzgk:silent! s/\\v +$//<cr>:noh<cr>`z:delmarks z<cr>", { silent = true })

map({ "n", "x" }, [[']], "`", { remap = true })
map({ "n", "x" }, ";", ":")

map("n", "[<space>", ":<C-u>put! =repeat(nr2char(10),v:count1)<CR>", { silent = true, desc = "Empty lines above" })
map("n", "]<space>", ":<C-u>put =repeat(nr2char(10),v:count1)<CR>", { silent = true, desc = "Empty lines below" })

map("n", "<space><Tab>", "<C-^>", { desc = "Switch to Last buffer" })

map("n", "<Esc>", "<cmd>nohlsearch<CR>")
