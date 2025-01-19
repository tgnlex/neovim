local win = require('library.functions.win')
local function get_tab_name(tabpage)
  local title = vim.t[tabpage].tab_title
  if title ~= nil then
    return title
  end
  local window = vim.api.nvim_tabpage_get_win(tabpage)
  if win.is_float(window) then
    return vim.t[tabpage].last_buffer_filename
  end
  local filename = win.get_best(tabpage, window)
  vim.t[tabpage].last_buffer_filename = filename
  return filename
end

function Tabline()
  local tl = {}
  local current = vim.api.nvim_get_current_tabpage()
  for i, tabpage in ipairs(vim.api.nvim_list_tabpages()) do
    local hi = tabpage == current and "%#TabLineSel#" or "%#TabLine#"
    local hiSep = tabpage == current and "%#TabLineSelSep#" or "%#TabLineSep#"
    table.insert(tl, "%" .. i .. "T")
    table.insert(tl, hi .. " " .. get_tab_name(tabpage) .. " ")
    table.insert(tl, hiSep .. "▓▒░ " .. hi)
  end
  table.insert(tl, "%T")
  table.insert(tl, '%#TabLineFill#')
  return table.concat(tl, '')
end

vim.opt.tabline = [[%!v:lua.Tabline()]]
