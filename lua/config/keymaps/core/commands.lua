local map = vim.keymap.set
local uv = vim.uv 
-- DELETE BUFFERS --
map("n", [[\D]], function()
  local buf_ids = vim.api.nvim_list_bufs()
  local cur_buf = vim.api.nvim_win_get_buf(0)

  for _, buf_id in pairs(buf_ids) do
    if vim.api.nvim_get_option_value("buflisted", { buf = buf_id }) and buf_id ~= cur_buf then
      vim.api.nvim_buf_delete(buf_id, { force = true })
    end
  end
end, { desc = "delete other buffers" })

-- RELOAD CONFIG -- 
map("n", "<leader>sv", function()
  vim.cmd([[
      update $MYVIMRC
      source $MYVIMRC
    ]])
  vim.notify("Nvim config successfully reloaded!", vim.log.levels.INFO, { title = "nvim-config" })
end, { silent = true, desc = "reload init.lua" })

-- LINE JOIN --
map("n", "J", function()
  vim.cmd([[
      normal! mzJ`z
      delmarks z
    ]])
  end, 
{ desc = "join lines without moving cursor"})

