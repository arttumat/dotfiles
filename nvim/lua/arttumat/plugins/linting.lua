return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")

    local function choose_linter(langs, map)
      local default_linter
      local config_found
      for key, linter in pairs(map) do
        if type(linter) == "table" then
          for _, file in pairs(linter) do
            local fn = vim.fn
            local file_exists = fn.filereadable(fn.expand(fn.getcwd() .. "/" .. file))
            if file_exists == 1 then
              config_found = key
              break
            end
          end
        else
          if type(linter) == "string" then
            default_linter = linter
          end
        end
      end
      for _, lang in pairs(langs) do
        lint.linters_by_ft[lang] = { config_found or default_linter }
      end
    end

    choose_linter({
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
    }, {
      biomejs = {
        "biome.json",
        "biome.jsonc",
      },
      "eslint_d",
    })

    lint.linters_by_ft.python = { "pylint" }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
