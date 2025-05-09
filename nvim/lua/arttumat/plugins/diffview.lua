return {
  "sindrets/diffview.nvim",
  config = function()
    local diffview = require("diffview")
    diffview.setup({
      enhanced_diff_hl = true,
    })

    local map = vim.keymap.set

    -- current file history followed through renames
    map("n", "<leader>hf", "<cmd>DiffviewFileHistory --follow %<cr>", { desc = "File history" })

    -- current visual selection diff
    map("v", "<leader>hl", "<Esc><Cmd>'<,'>DiffviewFileHistory --follow<CR>", { desc = "Range history" })

    map("n", "<leader>hr", "<cmd>DiffviewOpen<cr>", { desc = "Repo diff agains HEAD" })

    local function get_default_branch_name()
      local res = vim.system({ "git", "rev-parse", "--verify", "main" }, { capture_output = true }):wait()
      return res.code == 0 and "main" or "master"
    end

    -- Diff against local master branch
    map("n", "<leader>hm", function()
      vim.cmd("DiffviewOpen " .. get_default_branch_name())
    end, { desc = "Diff against master" })

    -- Diff against remote master branch
    map("n", "<leader>hM", function()
      vim.cmd("DiffviewOpen HEAD..origin/" .. get_default_branch_name())
    end, { desc = "Diff against origin/master" })

    -- Highlight changed words.
    map("n", "<leader>vw", require("gitsigns").toggle_word_diff, { desc = "Toggle word diff" })

    -- Highlight added lines.
    map("n", "<leader>vL", require("gitsigns").toggle_linehl, { desc = "Toggle line highlight" })

    -- Highlight removed lines.
    map("n", "<leader>vv", require("gitsigns").toggle_deleted, { desc = "Toggle deleted (all)" })
  end,
}
