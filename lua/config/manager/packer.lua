
local m = { 
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end 
  }
}

return m;
