local M = {}

local fs = require('rscode.utils.filesystem')

function M.bootstrap(lazypath)
	lazypath = lazypath or fs.join_paths(vim.fn.stdpath('data'), 'lazy', 'lazy.nvim')
	if not fs.is_directory(lazypath) then
		vim.fn.system({
			'git',
			'clone',
			'--filter=blob:none',
			'https://github.com/folke/lazy.nvim.git',
			'--branch=stable',
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)
end

return M
