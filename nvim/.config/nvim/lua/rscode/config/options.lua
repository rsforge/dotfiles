local M = {}

local opt = vim.opt
local g   = vim.g

function M.load()
	opt.history = 1000
    opt.exrc = true

	opt.timeout = true
	opt.timeoutlen = 400
	opt.updatetime = 250

	opt.number = true
	opt.numberwidth = 2
	opt.relativenumber = true

	opt.signcolumn = 'yes'

	opt.mouse = ''
	opt.cursorline = true
	opt.scrolloff = 8
	opt.sidescrolloff = 8

	opt.ignorecase = true
    opt.hlsearch = false
	opt.smartcase = true
	opt.incsearch = true
	opt.expandtab = true
	opt.smarttab = true
	opt.tabstop = 4
	opt.shiftwidth = 4
	opt.softtabstop = 4
	opt.cindent = true
	opt.autoindent = true
	opt.smartindent = true
	opt.showtabline = 0

	opt.foldmethod = 'indent'
	opt.foldlevelstart = 99
	opt.foldnestmax = 20
	opt.foldminlines = 1

	opt.splitbelow = true
	opt.splitright = true

	opt.backup = false
	opt.writebackup = false
	opt.undofile = true
	opt.swapfile = false
	opt.fileencoding = 'utf-8'

	opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,terminal,localoptions'

	opt.wrap = false
	opt.showmode = false
	opt.cmdheight = 1
	opt.clipboard = 'unnamedplus'
	opt.termguicolors = true
    opt.conceallevel = 3

	g.mapleader = ' '
	g.loaded_netrw = 1
	g.loaded_netrwPlugin = 1
end

return M
