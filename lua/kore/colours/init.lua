local Config = require("kore.config")
local Util = require("kore.util")

local Colours = {}

function Colours.setup()
    -- retrieve theme colours
    local colours = vim.deepcopy(Util.module("kore.colours." .. Config.theme))

    return colours
end

return Colours
