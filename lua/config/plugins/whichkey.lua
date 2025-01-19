local status_ok, which_key = pcall(require, "which-key")
if not status_ok then 
  return 
end

local setup = {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  key_labels = {},
  icons = {
    breadcrumb = "»",
    separator = "➜", 
    group = "+",
  },
  popup_mappings = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>"
  },
  window = {
    border = "rounded", 
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 }, 
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },
    width =  { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
  ignore_missing = true,
  hidden = { "<silent>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = true,
  triggers = "auto", 
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
}
local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}
local mappings = {
  ["e"] = {"<cmd>NvimTreeToggle<cr>", "Explorer"},
  ["k"] = {"<cmd>bdelete<CR>", "Kill Buffer"},
  ["p"] = {"<cmd>Lazy<CR>", "Plugin Manager"},
  ["q"] = {"<cmd>wqall!<CR>", "Quit"},
  ["w"] = {"<cmd>w!<CR>", "Save"},
  f = {
    name = "File Search",
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find files" },
        t = { "<cmd>Telescope live_grep <cr>", "Find Text Pattern In All Files" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
  },
  s = {
    name= "Search",
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        c = { "<cmd>Telescope commands<cr>", "Commands" },      
  },
}

which_key.setup(setup)
which_key.register(mappings, opts)

