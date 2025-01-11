local icons = require("config.plugins.barbar.icons")
local barbar = require("barbar")

local levels = vim.diagnostic.severity

barbar.setup {
  animation = true,
  clickable = true,
  exclude_ft = {'javascript'},
  exclude_name = {'package.json'},
  highlight_visible = true,
  icons = {
    buffer_index = false,
    buffer_number = false,
    button = icons.button,
    diagnostics = {
     [levels.ERROR] = { enabled = true, icon = icons.err },
     [levels.WARN]  = { enabled = true },
     [levels.INFO]  = { enabled = true },
     [levels.HINT]  = { enabled = true },
    },
    gitsigns = {
      added = { enabled = true, icon = icons.git.add },
      changed = { enabled = true, icon = icons.git.change },
      deleted = { enabled = true, icon = icons.git.delete },
    },
    filetype = {
      enabled = true,
      custom_colors = false,
    },
    modified = { button = icons.btn.modified },
    inactive = { button = icons.btn.inactive },
    pinned = { button = icons.btn.pinned, filename = true },
    seperator = {
      left = icons.sep.left, 
      right = icons.sep.right 
    },
    alternate = { filetype = { enabled = false }},
    visible = { modifed = { buffer_number = false }},
    current = { buffer_index = true },
    seperator_at_end = true,
  },
  insert_at_end = true,
  maximum_padding = 1,
  minimum_padding = 1,
  maximum_length = 30,
  minimum_length = 0,
  semantic_letters = true,
  sidebar_filetypes = {
    NvimTree = true,
    undotree = { text = 'undotree' },
    ['neo-tree'] = { event = 'BufWipeout' },
    Outline = { event = 'BufWinLeave', text = 'symbols-outline' },
  },
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  no_name_title = nil,
}
