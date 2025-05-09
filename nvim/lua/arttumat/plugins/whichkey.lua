return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  dependencies = {
    "echasnovski/mini.icons",
  },
  opts = {
    spec = {
      { "<leader>a", group = "ai" },
      { "gm", group = "+Copilot chat" },
      { "gmh", desc = "Show help" },
      { "gmd", desc = "Show diff" },
      { "gmp", desc = "Show system prompt" },
      { "gms", desc = "Show selection" },
      { "gmy", desc = "Yank diff" },
    },
  },
}
