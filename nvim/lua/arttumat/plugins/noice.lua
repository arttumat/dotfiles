return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        -- ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    notify = {
      background_color = "#161616",
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
  },
  config = function()
    require("noice").setup({
      cmdline = {
        view = "cmdline",
      },
      views = {
        mini = {
          win_options = {
            winblend = 0, -- Set winblend to 0 for the mini view
          },
        },
      },
    })
    require("notify").setup({
      background_colour = "#000000", -- Set background color to fix transparency issue
    })

    vim.notify = require("notify")
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    -- "hrsh7th/nvim-cmp",
  },
}
