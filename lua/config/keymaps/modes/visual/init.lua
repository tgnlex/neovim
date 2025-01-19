local map = vim.keymap.set
local uv = vim.uv 

map("x", ";", ":")
map("x", "$", "g_")
map("x", "<", "<gv")
map("x", ">", ">gv")
map("x", "c", '"_c')

map("x", "<A-k>", '<cmd>call utils#MoveSelection("up")<cr>', { desc = "move selection up" })

map("x", "<A-j>", '<cmd>call utils#MoveSelection("down")<cr>', { desc = "move selection down" })

map("x", "p", '"_c<Esc>p')

map({ "x", "o" }, "iu", "<cmd>call text_obj#URL()<cr>", { desc = "URL text object" })
map({ "x", "o" }, "iB", ":<C-U>call text_obj#Buffer()<cr>", { desc = "buffer text object" })

