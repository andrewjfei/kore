local Config = require("kore.config")
local Util = require("kore.util")

local M = {}

-- stylua: ignore
M.plugins = {
    -- ["lazy.nvim"]               = "lazy",
    -- ["nvim-cmp"]                = "cmp",
    -- ["nvim-treesitter-context"] = "treesitter-context",
    -- ["telescope.nvim"]          = "telescope",
    -- ["which-key.nvim"]          = "which-key",
}

local me = debug.getinfo(1, "S").source:sub(2)
me = vim.fn.fnamemodify(me, ":h")

function M.get_group(name)
	---@type {get: kore.HighlightsFn, url: string}
	return Util.mod("kore.groups." .. name)
end

---@param colors ColorScheme
---@param opts kore.Config
function M.get(name, colors, opts)
	local mod = M.get_group(name)
	return mod.get(colors, opts)
end

---@param colors ColorScheme
---@param opts kore.Config
function M.setup(colors, opts)
	local groups = {
		base = true,
		-- kinds = true,
		-- semantic_tokens = true,
		-- treesitter = true,
	}

    -- enable highlight groups for all plugins
	for _, group in pairs(M.plugins) do
		groups[group] = true
	end

	local names = vim.tbl_keys(groups)
	table.sort(names)

	local cache_key = opts.style
	local cache = opts.cache and Util.cache.read(cache_key)

	local inputs = {
		colors = colors,
		plugins = names,
		version = Config.version,
	}

	local ret = cache and vim.deep_equal(inputs, cache.inputs) and cache.groups

	if not ret then
		ret = {}

		-- merge highlights
		for group in pairs(groups) do
			for k, v in pairs(M.get(group, colors, opts)) do
				ret[k] = v
			end
		end

		Util.resolve(ret)

        -- cache highlight groups
		if opts.cache then
			Util.cache.write(cache_key, { groups = ret, inputs = inputs })
		end
	end

	opts.on_highlights(ret, colors)

	return ret, groups
end

return M
