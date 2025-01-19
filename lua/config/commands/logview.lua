
vim.api.nvim_create_user_command('ReadLog',
  function() 
    vim.cmd(":terminal cat $NVIM_LOG_FILE") 
  end, 
{})
