-- return {
--   "nyoom-engineering/oxocarbon.nvim",
--   config = function()
--     vim.opt.background = "dark" -- set this to dark or light
--     vim.cmd("colorscheme oxocarbon")
--   end,
-- }
return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup({
      style = "night",
    })
    vim.cmd("colorscheme tokyonight")
    vim.o.background = "dark"
  end,
}
