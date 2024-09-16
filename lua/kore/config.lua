local M = {}

M.version = "0.0.0"

---@class kore.Config
---@field on_colors fun(colors: ColorScheme)
---@field on_highlights fun(highlights: kore.Highlights, colors: ColorScheme)
M.defaults = {
	style = "orange", -- theme name

	--- You can override specific color groups to use other groups or a hex color
	--- function will be called with a ColorScheme table
	---@param colors ColorScheme
	on_colors = function(colors) end,

	--- You can override specific highlights to use other groups or a hex color
	--- function will be called with a Highlights and ColorScheme table
	---@param highlights kore.Highlights
	---@param colors ColorScheme
	on_highlights = function(highlights, colors) end,

	cache = true, -- cache theme for better performance
}

---@type kore.Config
M.options = nil

---@param options? kore.Config
function M.setup(options)
	M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

---@param opts? kore.Config
function M.extend(opts)
	return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or M.options
end

setmetatable(M, {
	__index = function(_, k)
		if k == "options" then
			return M.defaults
		end
	end,
})

return M
