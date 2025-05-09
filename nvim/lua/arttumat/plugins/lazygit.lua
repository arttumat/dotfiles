return {
  "kdheepak/lazygit.nvim",
  -- optional for floating window border decoration
  config = function()
    -- vim.g.lazygit_floating_window_border_chars = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
    vim.g.lazygit_floating_window_border_chars = { "", "", "", "", "", "", "", "" }
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
