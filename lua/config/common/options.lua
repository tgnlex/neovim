local opt = vim.opt
-- DEFAULT FILE ENCODING --
opt.encoding = "utf-8"
-- STARTUP MESSAGE --
opt.shortmess:append("sI")
-- LINE NUMBERS --
opt.number = true
opt.showmode = true
-- RELATIVE LINE NUMBERS --
opt.relativenumber = false
-- SYNTAX HIGHLIGHTING
opt.termguicolors = true
opt.synmaxcol = 512
-- CMD DISPLAY
opt.cmdheight = 1
-- CLIPBOARD TYPE --
opt.clipboard = 'unnamedplus'
-- INCREMENTAL SEARCH --
opt.incsearch = true

opt.inccommand = "split"
-- HIGHLIGHT SEARCH --
opt.hlsearch = true
-- AUTO CREATE SWAP --
opt.swapfile = false
-- LINE WRAP --
opt.wrap = false
-- WRAP INDENTATION --
opt.breakindent = true
-- HIGHLIGHT CURSOR --
opt.cursorline = true
-- TAB EXPANSION --
opt.expandtab = false
-- AUTOMATIC INDENTING --
opt.smartindent = true
opt.autoindent = true
-- INDENT COLUMNS --
opt.tabstop = 2
opt.scrolloff = 7
-- INDENT DELETION -- 
opt.softtabstop = 2 
opt.shiftwidth = 2 
-- SHOW MATCHING BRACKETS --
opt.showmatch = true
-- SHOW INVISIBLES --
opt.list = true

