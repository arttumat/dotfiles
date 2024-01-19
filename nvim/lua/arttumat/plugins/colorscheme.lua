return {
  "drewtempelmeyer/palenight.vim",
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme palenight]])
    vim.g.palenight_terminal_italics = 1
  end,
}
