local packer_config = require("config.manager.packer")
local deps = require("config.manager.deps")
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
  pattern = "packer.lua",
  command = "source <afile> | PackerCompile",
})
local ok, packer = pcall(require, "packer")
if not ok then 
  return 
end
packer.init(packer_config)
return require("packer").startup(function(use)
  -- PLUGIN MANAGER --
  use {"wbthomason/packer.nvim"}
  -- LIBRARIES -- 
  use { deps.plenary }
  use { deps.popup }
  use { deps.icons }
  use { deps.mini }
  use { deps.nui }
  use { deps.gitsign, require={ deps.plenary } }
  -- TREESITTER -- 
  use { "nvim-treesitter/nvim-treesitter", ['do'] = ':TSUpdate'}
  use { "joosepAlviste/nvim-ts-context-commentstring" }
  use { "windwp/nvim-ts-autotag" }
  -- COMPLETIONS --
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
  use { 'saadparwaiz1/cmp_luasnip' }
  -- SNIPPETS --
  use { 'L3MON4D3/LuaSnip'}
  -- STATUS LINE --
  use { "nvim-lualine/lualine.nvim", event="BufEnter", requires={deps.icons}}
  use { "akinsho/bufferline.nvim" }
  -- USER INTERFACE --
  use { "stevearc/dressing.nvim" }
  use { "bekaboo/dropbar.nvim" }
  use { 
    "nvim-tree/nvim-tree.lua",
    dependencies = {deps.icons, opt = true },
    opts = function() require("config.plugins.tree") end,
  }
  use { "romgrk/barbar.nvim", requires = { deps.gitsign, deps.icons } }
  use { "kosayoda/nvim-lightbulb" }
  -- DASHBOARD --
  use { 'nvimdev/dashboard-nvim', event = 'VimEnter', dependencies = {deps.icons} }
  -- GIT --
  use { "TimUntersberger/neogit" }
  use { "akinsho/git-conflict.nvim" }
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
  -- FUNCTIONALITY --
  use { "numToStr/Comment.nvim" }
  use { "luukvbaal/statuscol.nvim" }
  use { "kevinhwang91/nvim-hlslens" }
  use { "rcarriga/nvim-notify" }
  use { "smoka7/hop.nvim" }
  use { "nvim-telescope/telescope.nvim", dependencies={deps.plenary} }
  use { "ibhagwan/fzf-lua", dependencies={deps.icons} }
  use { "tomasky/bookmarks.nvim" }
  use { "akinsho/git-conflict.nvim" }
  use { "ThePrimeagen/harpoon" }
  use { "gbprod/yanky.nvim" }
  
  -- COLORSCHEMES --
  use { "sainnhe/sonokai" }
  use { "sainnhe/edge" }
  -- MISC --
  use { "uga-rosa/ccc.nvim" }
  use { "serenevoid/kiwi.nvim" }
  if PACKER_BOOTSTRAP then require('packer').sync() end
end)
