local m = {}
function m.is_table(value) 
  return type(value) == "table"
end
function m.is_string(value)
  return type(value) == "string"
end

function m.starts_with(str, start)
	return str:sub(1, #start) == start
end

function m.print_tbl(table)
  print(vim.inspect(table))
end
function m.has_key(t, key)
  for t_key, _ in pairs(t) do 
    if t_key == key then 
      return true
    end
	end
	return false 
end
function m.print_keys(table)
  for k in pairs(table) do print(k) end
end

m.cmd = function (name, command, desc)
  vim.api.nvim_create_user_command(name, command, desc)
end

m.reload = function()
  local presentReload, reload = pcall(require, "plenary.reload")
	if presentReload then
		local counter = 0
		for moduleName in pairs(package.loaded) do 
			if m.starts_with(moduleName, "lt.") then
				reload.reload_module(moduleName)
				counter = counter + 1
			end
		end
		vim.g.mapper_records = nil
		vim.notify("Reloaded ".. counter .. " modules!")
end
return m
