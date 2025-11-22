local M = {}

function M.init()
	require('rscode.config.options').load()
	local general = require('rscode.config.mappings.general')
	require('rscode.utils.cartographer').map(general)

    require('rscode.config.highlight')
end

return M
