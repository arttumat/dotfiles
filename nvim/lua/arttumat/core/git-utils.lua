local M = {}

function M.log_l()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local file = vim.fn.expand("%")
  local command = string.format("git log -L%d,%d:%s", start_line, end_line, file)

  vim.cmd("vnew")
  local bufnr = vim.api.nvim_get_current_buf()

  vim.fn.termopen(command, { on_exit = function(_, _, _) end })

  vim.schedule(function()
    if vim.api.nvim_buf_is_valid(bufnr) then
      vim.api.nvim_set_current_buf(bufnr)
      vim.cmd("startinsert")
    end
  end)
end

return M
