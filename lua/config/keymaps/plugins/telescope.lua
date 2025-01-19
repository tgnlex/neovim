local builtin = require("telescope.builtin")
local set = vim.keymap.set
set('n', '<SC-t', '<cmd>Telescope<cr>')
set('n', '<C-p>', builtin.find_files, {})
set('n', '<leader>fg', builtin.live_grep, {})
set('n', '<leader>fb', builtin.buffers, {})
set('n', '<leader>fg', builtin.help_tags, {})
-- UNDO --
set('n', '<leader>u', '<cmd>Telescope undo<cr>')

