local fn = vim.fn 
local api = vim.api 

vim.g.mapleader = ";"
vim.g.logging_level = "info"
vim.g.vimsyn_embed = 'l'
vim.g.mouse = 'a'


vim.g.loaded_netrw = 1 
vim.g.loaded_netrwPlugin = 1
vim.g.netrw_lifestyle = 3



if vim.g.is_win then 
  vim.g.netrw_http_cmd = "curl --ssl-no-revoke -Lo"
end



