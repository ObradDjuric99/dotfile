require("theprimeagen.set")
require("theprimeagen.remap")

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup("ThePrimeagen", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
	require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd({ "BufEnter" }, {
	pattern = { "*.ts", "*.js", "*.tsx" },
	command = "set autoindent expandtab tabstop=2 shiftwidth=2",
})

-- autocmd({ "BufWritePre" }, {
-- 	group = ThePrimeagenGroup,
-- 	pattern = "*",
-- 	command = [[%s/\s\+$//e]],
-- })

autocmd({ "VimEnter" }, {
	pattern = { "*" },
	command = "hi TreesitterContext guibg = #252321",
})
vim.cmd("hi diffRemoved guifg = red")
vim.cmd("hi diffAdded guifg = green")
vim.cmd("hi TreesitterContext guibg = #252321")
-- autocmd({ "BufWritePre" }, {
-- 	pattern = { "*" },
-- 	command = "silent Neoformat",
-- })
-- disable netrw at the very start of your init.lua (strongly advised)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_list_hide = "^./$"
