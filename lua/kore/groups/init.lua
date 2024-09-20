local Util = require("kore.util")

local Groups = {}

-- stylua: ignore
Groups.plugins = {
    ["lazy.nvim"]      = "lazy",
    ["nvim-cmp"]       = "cmp",
    -- ["nvim-treesitter-context"] = "treesitter-context",
    ["telescope.nvim"] = "telescope",
    -- ["which-key.nvim"]          = "which-key",
}

function Groups.get(name, colours)
	local mod = Util.module("kore.groups." .. name)
	return mod.get(colours)
end

function Groups.setup(colours)
	local mods = {
		base = true,
		-- kinds = true,
		treesitter = true,
		lsp = true,
	}

	-- enable highlight groups for all plugins
	for _, plugin in pairs(Groups.plugins) do
		mods[plugin] = true
	end

	local groups = {}

	-- combine group highlights
	for mod in pairs(mods) do
		for group, hl in pairs(Groups.get(mod, colours)) do
			groups[group] = hl
		end
	end

	return groups
end

return Groups
