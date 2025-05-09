return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    local function choose_formatter(langs, map)
      local default_formatter
      local config_found

      for key, formatter in pairs(map) do
        if type(formatter) == "table" then
          for _, file in pairs(formatter) do
            local fn = vim.fn
            local file_exists = fn.filereadable(fn.expand(fn.getcwd() .. "/" .. file))
            if file_exists == 1 then
              config_found = key
              break
            end
          end
        elseif type(formatter) == "string" then
          default_formatter = formatter
        end
      end

      for _, lang in pairs(langs) do
        conform.formatters_by_ft[lang] = { config_found or default_formatter }
      end
    end

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { lsp_fallback = true, async = false, timeout_ms = 1000 }
      end,
    })

    choose_formatter({
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "css",
      "html",
      "json",
      "yaml",
      "markdown",
      "graphql",
    }, {
      biome = { "biome.json", "biome.jsonc" },
      "prettier",
    })

    conform.formatters.biome = {
      command = "biome",
      args = { "check", "--write", "$FILENAME" },
      stdin = false,
    }

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })

    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })
    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
    })
  end,
}
