local M = {}

---@param opts? kore.Config
function M.setup(opts)
    opts = require("kore.config").extend(opts)

    local colors = require("kore.colors").setup(opts)
    local groups = require("kore.groups").setup(colors, opts)

    -- only needed to clear when not the default colorscheme
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "kore-" .. opts.style

    -- set highlight groups
    for group, hl in pairs(groups) do
        hl = type(hl) == "string" and { link = hl } or hl
        vim.api.nvim_set_hl(0, group, hl)
    end

    M.terminal(colors)

    return colors, groups, opts
end

---@param colors ColorScheme
function M.terminal(colors)
    -- dark
    vim.g.terminal_color_0 = colors.background
    vim.g.terminal_color_8 = colors.background_light

    -- light
    vim.g.terminal_color_7 = colors.foreground_dark
    vim.g.terminal_color_15 = colors.foreground

    -- colors
    vim.g.terminal_color_1 = colors.red
    vim.g.terminal_color_9 = colors.red

    vim.g.terminal_color_2 = colors.green
    vim.g.terminal_color_10 = colors.green

    vim.g.terminal_color_3 = colors.yellow
    vim.g.terminal_color_11 = colors.yellow

    vim.g.terminal_color_4 = colors.blue
    vim.g.terminal_color_12 = colors.blue

    vim.g.terminal_color_5 = colors.magenta
    vim.g.terminal_color_18 = colors.magenta

    vim.g.terminal_color_6 = colors.cyan
    vim.g.terminal_color_14 = colors.cyan
end

return M
