local nvim_ts = require("nvim-treesitter.configs")

nvim_ts.setup {
  ensure_installed = "all",
  highlight = { enable = true },
  textobjects = { enable = true },
  incremental_selection = { enable = true },
}
