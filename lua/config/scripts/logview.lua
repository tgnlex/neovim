
vim.api.nvim_create_user_command('ReadLog',
  function() 
    vim.cmd("echo $NVIM_LOG_FILE") 
  end, 
{})