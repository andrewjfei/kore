local M = {}

M.bg = "#000000"
M.fg = "#ffffff"

local uv = vim.uv or vim.loop

local me = debug.getinfo(1, "S").source:sub(2)
me = vim.fn.fnamemodify(me, ":h:h")

function M.mod(modname)
	if package.loaded[modname] then
		return package.loaded[modname]
	end
	local ret = loadfile(me .. "/" .. modname:gsub("%.", "/") .. ".lua")()
	package.loaded[modname] = ret
	return ret
end

---@param groups kore.Highlights
---@return table<string, vim.api.keyset.highlight>
function M.resolve(groups)
	for _, hl in pairs(groups) do
		if type(hl.style) == "table" then
			for k, v in pairs(hl.style) do
				hl[k] = v
			end

			hl.style = nil
		end
	end
	return groups
end

M.cache = {}

function M.cache.file(key)
	return vim.fn.stdpath("cache") .. "/kore-" .. key .. ".json"
end

---@param key string
function M.cache.read(key)
	---@type boolean, kore.Cache
	local ok, ret = pcall(function()
		return vim.json.decode(M.read(M.cache.file(key)), {
			luanil = {
				object = true,
				array = true,
			},
		})
	end)

	return ok and ret or nil
end

---@param key string
---@param data kore.Cache
function M.cache.write(key, data)
	pcall(M.write, M.cache.file(key), vim.json.encode(data))
end

function M.cache.clear()
	for _, style in ipairs({ "storm", "day", "night", "moon" }) do
		uv.fs_unlink(M.cache.file(style))
	end
end

return M
