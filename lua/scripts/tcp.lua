local function create_server(host, port, on_connect)
  local server = vim.uv.new_tcp()
  server:bind(host, port) 
  server:listen(128, function(err) 
    assert(not err, err)
    local sock = vim.uv.new_tcp() 
    server:accept(sock)
    on_accept(sock)
  end)
  return server
end
local server = create_server('0.0.0.0', 0, function(sock) 
  sock:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then 
      sock:write(chunk) 
    else 
      sock.close()
    end
  end)
end)
print('TCP echo-server listening on port: '..server:getsockname().port)
