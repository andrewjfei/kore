local Config = require("kore.config")

local Theme = {}

function Theme.setup()
	local colours = require("kore.colours").setup()
	local groups = require("kore.groups").setup(colours)

	-- reset highlight groups (i.e. colour scheme)
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.g.colors_name = "kore-" .. Config.theme
	vim.o.termguicolors = true

	-- set highlight groups
	for group, hl in pairs(groups) do
		-- if highlight is a string then use a link
		hl = type(hl) == "string" and { link = hl } or hl
		vim.api.nvim_set_hl(0, group, hl)
	end

	require("kore.terminal").setup(colours)
end

return Theme
