
vim.api.nvim_create_user_command('Version',
  function() 
    print(vim.inspect(vim.version())) 
  end, 
{})
