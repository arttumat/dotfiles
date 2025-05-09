local autocmd = vim.api.nvim_create_autocmd
local Format = vim.api.nvim_create_augroup("Format", { clear = true })

-- Auto-format for specific filetypes on save
autocmd("BufWritePre", {
  group = Format,
  pattern = "*.ts,*.tsx,*.jsx,*.js",
  callback = function()
    if vim.fn.exists(":TSToolsOrganizeImports") then
      -- vim.cmd("TSToolsOrganizeImports")
      -- vim.cmd("TSToolsSortImports")
      vim.cmd("TSToolsRemoveUnusedImports")
      return {}
    end
    return {}
  end,
})

-- Quickfix specific keymap for `dd` to remove an item
local function remove_qf_item()
  local curqfidx = vim.fn.line(".") - 1
  local qfall = vim.fn.getqflist()
  table.remove(qfall, curqfidx + 1)
  vim.fn.setqflist(qfall, "r")
  vim.cmd((curqfidx + 1) .. "cfirst")
  vim.cmd("copen")
end

vim.api.nvim_create_user_command("RemoveQFItem", remove_qf_item, {})

-- Add autocmd to map `dd` in the quickfix window
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "dd", ":RemoveQFItem<CR>", { noremap = true, silent = true })
  end,
})
