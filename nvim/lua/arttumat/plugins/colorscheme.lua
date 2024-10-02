-- return {
--   "drewtempelmeyer/palenight.vim",
--   priority = 1000,
--   config = function()
--     vim.cmd([[colorscheme palenight]])
--     vim.g.palenight_terminal_italics = 1
--   end,
-- }

-- return {
--   "neanias/everforest-nvim",
--   version = false,
--   lazy = false,
--   priority = 1000, -- make sure to load this before all the other start plugins
--   -- Optional; default configuration will be used if setup isn't called.
--   config = function()
--     require("everforest").setup({
--       background = "hard",
--       colours_override = function(palette)
--         palette.bg0 = "#1e2326"
--
--         local TelescopeColor = {
--           TelescopeMatching = { fg = palette.green },
--           TelescopeSelection = { fg = palette.fg, bg = palette.bg0, bold = true },
--           TelescopeSelectionCaret = { fg = palette.green, bg = palette.bg0, bold = true },
--
--           TelescopePromptPrefix = { bg = palette.bg1, fg = palette.blue },
--
--           TelescopePromptNormal = { bg = palette.bg0 },
--           TelescopeResultsNormal = { bg = palette.bg1 },
--           TelescopePreviewNormal = { bg = palette.bg0 },
--
--           TelescopePromptBorder = { bg = palette.bg1, fg = palette.bg1 },
--           TelescopeResultsBorder = { bg = palette.bg1, fg = palette.bg1 },
--           TelescopePreviewBorder = { bg = palette.bg1, fg = palette.bg1 },
--
--           TelescopePromptTitle = { bg = palette.blue, fg = palette.bg0 },
--           TelescopeResultsTitle = { bg = palette.purple, fg = palette.bg0 },
--           TelescopePreviewTitle = { bg = palette.green, fg = palette.bg0 },
--         }
--
--         for hl, col in pairs(TelescopeColor) do
--           vim.api.nvim_set_hl(0, hl, col)
--         end
--       end,
--     })
--     vim.cmd([[colorscheme everforest]])
--   end,
-- }

return {
  "nyoom-engineering/oxocarbon.nvim",
  config = function()
    vim.opt.background = "dark" -- set this to dark or light
    vim.cmd("colorscheme oxocarbon")
  end,
}

-- return { "EdenEast/nightfox.nvim" }
