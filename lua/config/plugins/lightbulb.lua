local plugin = require("nvim-lightbulb")
local icons = { lightbulb = "💡", lens = "🔎" }
local events = { 
  sign = "LightBulbSign", 
  vtext = "LightBulbVirtualText", 
  float ="LightBulbFloatWin",
  number = "LightBulbNumber",
  line = "LightBulbLine",
  cursor = "CursorHold",
  cursor_i = "CursorHoldI"
}

plugin.setup{
  priority = 10,
  hide_in_unfocued_buffer = true,
  link_highlights = true,
  validate_config = "auto",
  action_kinds = nil,
  code_lenses = false,
  sign = {
    enabled = true,
    text = icons.lightbulb,
    lens_text = icons.lens,    
    hl = events.sign
  },
  virtual_text = {
    enabled = true,
    text = icons.lightbulb,
    lens_text = icons.lens, 
    hl = events.vtext
  },
  float = {
    enabled = true,
    text = icons.lightbulb,
    lens_text = icons.lens,
    hl = events.float,
    win_opts = { focusable = false },
  },
  status_text = {
    enabled = false,
    text = icons.lightbulb,
    lens_text = icons.lens,
    text_unavailable = "",
  },
  number = {enabled = false, hl = events.number },
  line = {enabled = false, hl = events.line },

  autocmd = { 
    enabled = true,
    updatetime = 200,
    events = { events.cursor, events.cursor_i },
    pattern = { "*" },
  },
  ignore = {
    clients = {},
    ft = {},
    actions_without_kind = false,
  },
  ---@type (fun(client_name: string, result:lsp.CodeAction|lsp.Command):boolean)|nil
  filter = nil,
}
