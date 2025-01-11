local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
  pattern = "packer.lua",
  command = "source <afile> | PackerCompile",
})
local ok, packer = pcall(require, "packer")
if not ok then 
  return 
end
packer.init({ 
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end 
  }
})
return require("packer").startup(function(use)
  -- PLUGIN MANAGER --
  use {"wbthomason/packer.nvim"}
  -- LIBRARIES -- 
  use {"nvim-lua/popup.nvim"}
  use {"nvim-lua/plenary.nvim"}
  use {"nvim-tree/nvim-web-devicons"}
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
  use{ "lewis6991/gitsigns.nvim", requires={'nvim-lua/plenary.nvim'}}
  use{ "nvim-lualine/lualine.nvim", event="BufEnter", requires={"nvim-web-devicons"}}
  use{ 
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons", opt = true },
    opts = function()
      require("config.plugins.tree")
    end,
  }
  use{ 
    "romgrk/barbar.nvim", 
    requires = { 
      'lewis6991/gitsigns.nvim', 
      'nvim-tree/nvim-web-devicons',
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
  use { "nvim-telescope/telescope.nvim", dependencies={"nvim-lus/plenary.nvim"}}
  if PACKER_BOOTSTRAP then require('packer').sync() end
end)
