return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      direction = "float",
      open_mapping = [[<leader>tt]],
    })
    local Terminal = require("toggleterm.terminal").Terminal
    local gh_dash = Terminal:new({ cmd = "gh dash", hidden = true, direction = "float" })

    function _gh_dash_toggle()
      gh_dash:toggle()
    end

    vim.keymap.set("n", "<leader>gh", "<cmd>lua _gh_dash_toggle()<CR>", { noremap = true, silent = true })
  end,
}
