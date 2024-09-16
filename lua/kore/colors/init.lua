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

    colors.git.ignore = colors.dark3
    colors.black = colors.bg
    colors.border_highlight = colors.blue1
    colors.border = colors.black

    -- Popups and statusline always get a dark background
    colors.bg_popup = colors.bg_dark
    colors.bg_statusline = colors.bg_dark

    -- Sidebar and Floats are configurable
    colors.bg_sidebar = colors.bg_dark
    colors.bg_float = colors.bg_dark

    colors.bg_visual = colors.blue0
    colors.bg_search = colors.blue0
    colors.fg_sidebar = colors.fg_dark
    colors.fg_float = colors.fg

    colors.error = colors.red1
    colors.todo = colors.blue
    colors.warning = colors.yellow
    colors.info = colors.blue2
    colors.hint = colors.teal

    colors.rainbow = { colors.blue, colors.yellow, colors.green, colors.teal, colors.magenta, colors.purple }

    -- override colours if configured in options
    opts.on_colors(colors)

    return colors, opts
end

return M
