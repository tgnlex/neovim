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

  use {deps.plenary}
  use {deps.gitsign, require={deps.plenary}}
  use {deps.popup}
  use {deps.icons}
  use {deps.nui}
  -- CORE -- 
  use {"nvim-treesitter/nvim-treesitter", ['do'] = ':TSUpdate'}
  -- COMPLETIONS --
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-nvim-lsp-signature-help'}
  use {'saadparwaiz1/cmp_luasnip'}
  -- SNIPPETS --
  use {'L3MON4D3/LuaSnip'}
  -- USER INTERFACE --

  use{ "nvim-lualine/lualine.nvim", event="BufEnter", requires={deps.icons}}
  use{ 
    "nvim-tree/nvim-tree.lua",
    dependencies = {devicons, opt = true },
    opts = function()
      require("config.plugins.tree")
    end,
  }
  use{ 
    "romgrk/barbar.nvim", 
    requires = { 
      deps.gitsign, 
      deps.icons,
    }
  }
  -- FORMATTING --
  use {"stevearc/conform.nvim"}
  use { 
    "windwp/nvim-autopairs", 
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  }
  -- FUNCTIONALITY --
  use { "nvim-telescope/telescope.nvim", dependencies={deps.plenary}}
  use { "ibhagwan/fzf-lua", dependencies={deps.icons}}
  if PACKER_BOOTSTRAP then require('packer').sync() end
end)
