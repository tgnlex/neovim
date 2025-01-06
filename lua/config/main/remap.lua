local map = vim.keymap.set
local uv = vim.uv 

map({ "n", "x" }, ";", ":")
map("i", "<c-u>", "<Esc>viwUea")
map("i", "<c-t>", "<Esc>b~lea")
map("n", "<leader>p", "m`o<ESC>p``", { desc = "paste below current line" })
map("n", "<leader>P", "m`o<ESC>p``", { desc = "paste above current line" })
map("n", "<leader>w", "<cmd>update<cr>", { silent = true, desc="save buffer" })
map("n", "<leader>q", "<cmd>x<cr>", { silent = true, desc = "quit current" })
map("n", "<leader>Q", "<cmd>qa!<cr>", { silent = true, desc = "quit nvim" })
map("n", "[l", "<cmd>lprevious<cr>zv", {silent = true, desc = "previous item"})
map("n", "]l", "<cmd>lnext<cr>zv", { silent = true, desc = "next item" })
map("n", "[L", "<cmd>lfirst<cr>zv", { silent = true, desc = "first location item" })
map("n", "]L", "<cmd>llast<cr>zv", { silent = true, desc = "last location item" })
map("n", "[q", "<cmd>cprevious<cr>zv", { silent = true, desc = "previous qf item" })
map("n", "]q", "<cmd>cnext<cr>zv", { silent = true, desc = "next qf item" })
map("n", "[Q", "<cmd>cfirst<cr>zv", { silent = true, desc = "first qf item" })
map("n", "]Q", "<cmd>clast<cr>zv", { silent = true, desc = "last qf item" })
map("n", [[\d]],"<cmd>bprevious <bar> bdelete #<cr>",{silent=true,desc="del buffer"})

map("n", [[\D]], function()
  local buf_ids = vim.api.nvim_list_bufs()
  local cur_buf = vim.api.nvim_win_get_buf(0)

  for _, buf_id in pairs(buf_ids) do
    if vim.api.nvim_get_option_value("buflisted", { buf = buf_id }) and buf_id ~= cur_buf then
      vim.api.nvim_buf_delete(buf_id, { force = true })
    end
  end
end, { desc = "delete other buffers" })

map("n", "<space>o", "printf('m`%so<ESC>``', v:count1)", {expr = true,desc ="insert line below"})
map("n", "<space>O", "printf('m`%sO<ESC>``', v:count1)", {expr = true,desc = "insert line above"})
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "^", "g^")
map("n", "0", "g0")
map("x", "$", "g_")
map({ "n", "x" }, "H", "^")
map({ "n", "x" }, "L", "g_")
map("x", "<", "<gv")
map("x", ">", ">gv")

map("n", "<leader>ev", "<cmd>tabnew $MYVIMRC <bar> tcd %:h<cr>", {silent = true,desc = "open init.lua" })

map("n", "<leader>sv", function()
  vim.cmd([[
      update $MYVIMRC
      source $MYVIMRC
    ]])
  vim.notify("Nvim config successfully reloaded!", vim.log.levels.INFO, { title = "nvim-config" })
end, { silent = true, desc = "reload init.lua" })
map("n", "<leader>v", "printf('`[%s`]', getregtype()[0])", {expr = true,
  desc = "reselect last pasted area"})
map("n", "/", [[/\v]])
map("n", "<leader>cd", "<cmd>lcd %:p:h<cr><cmd>pwd<cr>", { desc = "change cwd" })

map("t", "<ESC>", [[<c-\><c-n>]])

map("n", "<F11>", "<cmd>set spell!<cr>", { desc = "toggle spell" })
map("i", "<F11>", "<c-o><cmd>set spell!<cr>", {desc = "toggle spell"})

map("n", "c", '"_c')
map("n", "C", '"_C')
map("n", "cc", '"_cc')
map("x", "c", '"_c')

map("n", "<leader><space>", "<cmd>StripTrailingWhitespace<cr>", {desc="whitespace"})
map("n", "<leader>y", "<cmd>%yank<cr>", {desc = "yank entire buffer" })
map("n", "<leader>cl", "<cmd>call utils#ToggleCursorCol()<cr>", {desc = "toggle cursor"})
map("n", "<A-k>", '<cmd>call utils#SwitchLine(line("."), "up")<cr>', { desc = "move line up" })
map("n", "<A-j>", '<cmd>call utils#SwitchLine(line("."), "down")<cr>', { desc = "move line down" })

-- Move current visual-line selection up and down
map("x", "<A-k>", '<cmd>call utils#MoveSelection("up")<cr>', { desc = "move selection up" })

map("x", "<A-j>", '<cmd>call utils#MoveSelection("down")<cr>', { desc = "move selection down" })

-- Replace visual selection with text in register, but not contaminate the register,
-- see also https://stackoverflow.com/q/10723700/6064933.
map("x", "p", '"_c<Esc>p')

-- Go to a certain buffer
map("n", "gb", '<cmd>call buf_utils#GoToBuffer(v:count, "forward")<cr>', {
  desc = "go to buffer (forward)",
})
map("n", "gB", '<cmd>call buf_utils#GoToBuffer(v:count, "backward")<cr>', {
  desc = "go to buffer (backward)",
})

-- Switch windows
map("n", "<left>", "<c-w>h")
map("n", "<Right>", "<C-W>l")
map("n", "<Up>", "<C-W>k")
map("n", "<Down>", "<C-W>j")
map({ "x", "o" }, "iu", "<cmd>call text_obj#URL()<cr>", { desc = "URL text object" })
map({ "x", "o" }, "iB", ":<C-U>call text_obj#Buffer()<cr>", { desc = "buffer text object" })
map("n", "J", function()
  vim.cmd([[
      normal! mzJ`z
      delmarks z
    ]])
  end, { desc = "join lines without moving cursor"}
  )
map("n", "gJ", function()
  vim.cmd([[
      normal! mzgJ`z
      delmarks z
  ]])
  end, {desc = "join lines without moving cursor"}
)
 local undo_ch = { ",", ".", "!", "?", ";", ":" }
for _, ch in ipairs(undo_ch) do map("i", ch, ch .. "<c-g>u") end
map("i", "<A-;>", "<Esc>miA;<Esc>`ii")
map("i", "<C-A>", "<HOME>")
map("i", "<C-E>", "<END>")
map("c", "<C-A>", "<HOME>")
map("i", "<C-D>", "<DEL>")

map("n", "<leader>cb", function() 
  local cnt = 0 
  local blink_times = 7
  local timer = uv.new_timer()
  if timer == nil then 
    return 
  end 
  timer:start(0, 100, vim.schedule_wrap(function()
    vim.cmd([[
      set cursorcolumn!
      set cursorline!
    ]])
      if cnt == blink_times then 
        timer:close()
      end 
      cnt = cnt + i 
    end) 
  )
end, { desc = "show cursor" })
