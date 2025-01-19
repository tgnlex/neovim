local logging = require("logging")

local config = {
	level_name = "debug",
	save_logs = true
}
local logger = logging:new(config)
-- logger accessed via global variable
vim.g.logger = logger

