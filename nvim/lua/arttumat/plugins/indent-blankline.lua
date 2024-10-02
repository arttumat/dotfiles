return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  },
  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }
    local hooks = require("ibl.hooks")
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#fa4d56" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#009d9a" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#4589ff" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#ee5396" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#24a148" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#a56eff" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#1192e8" })
    end)

    vim.g.rainbow_delimiters = { highlight = highlight }
    require("ibl").setup({ scope = { highlight = highlight } })

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
  main = "ibl",
}
