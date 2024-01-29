-- return {
--   "drewtempelmeyer/palenight.vim",
--   priority = 1000,
--   config = function()
--     vim.cmd([[colorscheme palenight]])
--     vim.g.palenight_terminal_italics = 1
--   end,
-- }
return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  -- Optional; default configuration will be used if setup isn't called.
  config = function()
    require("everforest").setup({
      background = "hard",
      colours_override = function(palette)
        palette.bg0 = "#1e2326"
      end,
    })
    vim.cmd([[colorscheme everforest]])
  end,
}
