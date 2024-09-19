local Util = {}

-- retrieve file path of current lua script (i.e. "lua/kore/util.lua")
local root = debug.getinfo(1, "S").source:sub(2)

-- remove last two components (i.e. "lua")
root = vim.fn.fnamemodify(root, ":h:h")

-- retrieve lua module
function Util.module(path)
    -- return module if it has already been loaded
	if package.loaded[path] then
		return package.loaded[path]
	end

    -- load module
	local mod = loadfile(root .. "/" .. path:gsub("%.", "/") .. ".lua")()

    -- store module for future requests
	package.loaded[path] = mod

	return mod
end

return Util
