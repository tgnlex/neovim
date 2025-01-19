local map = vim.keymap.set

map("i", "<c-u>", "<Esc>viwUea")
map("i", "<c-t>", "<Esc>b~lea")
map("i", "<F11>", "<c-o><cmd>set spell!<cr>", {desc = "toggle spell"})
map("i", "<A-;>", "<Esc>miA;<Esc>`ii")
map("i", "<C-A>", "<HOME>")
map("i", "<C-E>", "<END>")
map("i", "<C-D>", "<DEL>")

