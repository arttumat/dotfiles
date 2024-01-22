require("hop").setup({ term_seq_bias = 0.5 })

vim.keymap.set("", "f", "<cmd>lua require'hop'.hint_char1()<cr>", {})
vim.keymap.set("n", "t", "<cmd>HopPattern<cr>", { noremap = true })
