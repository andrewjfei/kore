local Telescope = {}

Telescope.url = "https://github.com/nvim-telescope/telescope.nvim"

--- @param c Colours
function Telescope.get(c)
    -- stylua: ignore
    return {
        TelescopeBorder         = "TelescopeNormal",
        TelescopeMatching       = { fg = c.primary },
        TelescopeMultiSelection = { fg = c.tertiary },
        TelescopeNormal         = { fg = c.foreground, bg = c.background },
        TelescopePreviewBorder  = "TelescopeNormal",
        TelescopePreviewTitle   = "TelescopeNormal",
        TelescopePrompt         = "TelescopNormal",
        TelescopePromptBorder   = "TelescopeNormal",
        TelescopePromptPrefix   = { fg = c.primary, bg = c.background },
        TelescopePromptTitle    = "TelescopeNormal",
        TelescopeResultsBorder  = "TelescopeNormal",
        TelescopeResultsComment = { fg = c.comment },
        TelescopeResultsTitle   = "TelescopeNormal",
        TelescopeSelection      = { fg = c.foreground, bg = c.background_light },
        TelescopeSelectionCaret = "TelescopeSelection",
    }
end

return Telescope
