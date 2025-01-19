local dirname = "config.manager" .. "."
local config = require(dirname .. "packer")
local cmds = require(dirname .. "commands")
local deps = require(dirname .. "deps")
local v = require("library.vars")
local install = v.install_path
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
  pattern = "packer.lua",
  command = "source <afile> | PackerCompile",
})
local ok, packer = pcall(require, "packer")
if not ok then 
  return 
end
packer.init(config)
return require("packer").startup(function(use)
  -- PLUGIN MANAGER --
  use {"wbthomason/packer.nvim"}
  -- DEPENDENCIES -- 
  use { deps.plenary }
  use { deps.fugitive }
  use { deps.popup }
  use { deps.icons }
  use { deps.mini }
  use { deps.nui }
  use { deps.gitsign, require={ deps.plenary } }
  -- Telescope Extensions --
	use { deps.tscope.undo }
	-- UTILITIES -- 
	use { "NTBBloodbath/logging.nvim" }
	-- TREESITTER -- 
  use { "nvim-treesitter/nvim-treesitter", ['do'] = ':TSUpdate'}
  use { "joosepAlviste/nvim-ts-context-commentstring" }
  use { "windwp/nvim-ts-autotag" }
  -- COMPLETIONS --
  use { 'hrsh7th/nvim-cmp' }
	use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
  use { 'saadparwaiz1/cmp_luasnip' }
  -- SNIPPETS --
  use { 'L3MON4D3/LuaSnip'}
  -- STATUS LINE --
  use { "nvim-lualine/lualine.nvim", event="BufEnter", requires={deps.icons}}

  -- USER INTERFACE --
  use { "akinsho/bufferline.nvim", tag = "*", dependencies = {deps.icons}}
	use { "stevearc/dressing.nvim" }
  use { "bekaboo/dropbar.nvim" }
  use { "kosayoda/nvim-lightbulb" }
  -- DASHBOARD --
  use { 'nvimdev/dashboard-nvim', event = 'VimEnter', dependencies = {deps.icons} }
  -- FORMATTING --
  use { "stevearc/conform.nvim" }
  use { "sbdchd/neoformat" }
  use { 
    "windwp/nvim-autopairs", 
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  }
  -- FUZZY FINDER --
  use { "ibhagwan/fzf-lua", dependencies={deps.icons} }
  use {
    "nvim-telescope/telescope.nvim",
    dependencies={ deps.plenary, deps.tscope.undo }
  }
  -- COMMENTS --
  use { "numToStr/Comment.nvim" }
  -- STATUS COLUMNS --
  use { "luukvbaal/statuscol.nvim" }
  -- HIGHLIGHTING --
  use { "levouh/tint.nvim" }
  use { "kevinhwang91/nvim-hlslens" }
  -- NOTIFICATIONS --
  use { "rcarriga/nvim-notify" }
  -- NAVIGATION --
  use { "smoka7/hop.nvim" }
  use { 
    "nvim-tree/nvim-tree.lua",
    dependencies = {deps.icons, opt = true },
    opts = function() require("config.plugins.tree") end,
  }
  -- BOOKMARKS --
  use { "tomasky/bookmarks.nvim" }
  -- GIT --
  use { "NeogitOrg/neogit",
   dependencies = {deps.plenary, deps.telescope}
  }
	use {
    "rbong/vim-flog",
    dependencies = {deps.fugitive},
    cmd = cmds.flog
  }
  use { "akinsho/git-conflict.nvim" }
  -- SEARCH --
  use { "ThePrimeagen/harpoon" }
  -- COPY + PASTE 
  use { "gbprod/yanky.nvim" }  
  -- TERMINAL --
  use { "2kabhishek/termim.nvim", cmd = cmds.termim }
  -- TASK RUNNER --
	use { 'skywind3000/asynctasks.vim'}
	use { 'skywind3000/asyncrun.vim' }
	-- LANG INTEGRATIONS --
  use {"Olical/aniseed"}
  -- APP INTEGRATIONS --
  use {"aserowy/tmux.nvim"}
  -- PKG MANAGEMENT -- 
  use {"vuki656/package-info.nvim", requires = {deps.nui}}
  use {'saecki/crates.nvim'}
  -- COLORSCHEMES --
  use { "sainnhe/sonokai" }
  use { "sainnhe/edge" }
  -- MISC --
  use { "uga-rosa/ccc.nvim" }
  use { "serenevoid/kiwi.nvim" }
  if PACKER_BOOTSTRAP then require('packer').sync() end
end)
