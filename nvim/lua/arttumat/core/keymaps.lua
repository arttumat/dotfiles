-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- lazygit
keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Lazygit" })

-- diffview.nvim
keymap.set(
  "n",
  "<leader>dvo",
  ":DiffviewOpen<CR>",
  { desc = "Opens a new Diffview that compares against the current index" }
)
keymap.set(
  "n",
  "<leader>dvh",
  ":DiffviewFileHistory<CR>",
  { desc = "Opens a new file history view that lists all commits that affected the given paths" }
)

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, desc = "Move line down" }) -- move line down
keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, desc = "Move line up" }) -- move line up
keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, desc = "Move line down" })
keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, desc = "Move line up" })
keymap.set("x", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, desc = "Move line down" })
keymap.set("x", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, desc = "Move line up" })

keymap.set("n", "<Leader>rr", [[:%s///g<Left><Left>]], { noremap = true, silent = true }) -- replace all
keymap.set("n", "<Leader>rt", [[:%s///gc<Left><Left><Left>]], { noremap = true, silent = true }) -- replace all with confirmation

-- neotest
keymap.set("n", "<leader>nt", function()
  require("neotest").run.run()
end, { desc = "Run tests" })
keymap.set("n", "<leader>nf", function()
  require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run tests in file" })
