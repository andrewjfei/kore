local Util = require("kore.util")

local M = {}

---@type table<string,Palette>
M.styles = setmetatable({}, {
    __index = function(_, style)
        return vim.deepcopy(Util.mod("kore.colors." .. style))
    end,
})

---@param opts? kore.Config
function M.setup(opts)
    opts = require("kore.config").extend(opts)

    local palette = M.styles[opts.style]

    -- colour palette
    ---@class ColorScheme: Palette
    local colors = palette

    Util.bg = colors.bg -- may not be used
    Util.fg = colors.fg -- may not be used

    colors.none = "NONE"

    colors.diff = {
        add = colors.green2,
        delete = colors.red1,
        change = colors.blue7,
        text = colors.blue7,
    }

    opts.on_colors(colors)

    return colors, opts
end

return M
