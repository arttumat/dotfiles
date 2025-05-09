-- set leader key to space
vim.g.mapleader = " "

local map = vim.keymap.set

-- local Terminal = require("toggleterm.terminal").Terminal
-- local gh_dash = Terminal:new({ cmd = "gh dash", hidden = true })
--
-- function _gh_dash_toggle()
--   gh_dash:toggle()
-- end

---------------------
-- General Keymaps -------------------
map("n", ";", ":", { desc = "CMD enter command mode" })
-- use jk to exit insert mode
map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
map("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- lazygit
map("n", "<leader>gg", ":LazyGit<CR>", { desc = "Lazygit" })

-- git
map("v", "<leader>l", [[:<C-U>lua require('arttumat.core.git-utils').log_l()<CR>]], { noremap = true, silent = true })

-- window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

map("n", "<A-k>", ":m .-2<CR>==", { noremap = true, desc = "Move line up" }) -- move line up
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, desc = "Move line down" })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, desc = "Move line up" })

-- moving lines in visual mode with indenting
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
