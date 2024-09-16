local config = require("kore.config")

local M = {}

---@type {light?: string, dark?: string}
M.styles = {}

function M.load(opts)
    opts = require("kore.config").extend(opts)

    local style_bg = "dark" -- can be light or dark

    vim.o.background = style_bg
    M.styles[vim.o.background] = opts.style
    return require("kore.theme").setup(opts)
end

M.setup = config.setup

return M
