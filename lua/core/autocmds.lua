vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.py",
  callback = function()
    local template_path = vim.fn.expand("~/.config/nvim/templates/pythonTemplate.txt")
    local file = io.open(template_path, "r")
    if file then
      local lines = { "# -----------------------  " .. os.date("%Y%m%d") .. "  ------------------------- #" }
      for line in file:lines() do table.insert(lines, line) end
      table.insert(lines, "")
      vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
      file:close()
    end
  end,
})
