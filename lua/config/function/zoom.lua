

function zoom ()
  if vim.fn.winnr("$") > 1 then 
    if vim.g.zoomed ~= nil then 
      vim.cmd(vim.g.zoom_winrestcmd)
      vim.g.zoomed = 0
    else 
      vim.g.zoom_winrestcmd = vim.fn.winrestcmd()
      vim.cmd("resize")
      vim.cmd("vertical resize")
      vim.g.zoomed = 1 
    end
  else 
    vim.cmd("!tmux resize-pane -Z")
  end
end

