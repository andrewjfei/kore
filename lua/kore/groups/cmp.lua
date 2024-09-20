local Cmp = {}

Cmp.url = "https://github.com/hrsh7th/nvim-cmp"

--- @param c Colours
function Cmp.get(c)
    -- stylua: ignore
    return {
        CmpItemAbbr              = { fg = c.foreground },
        CmpItemAbbrDeprecated    = { fg = c.foreground, strikethrough = true },
        CmpItemAbbrMatch         = "Keyword",
        CmpItemAbbrMatchFuzzy    = "Keyword",
        CmpItemKind              = { fg = c.unknown },
        CmpItemKindClass         = "@type",
        CmpItemKindConstant      = "@constant",
        CmpItemKindConstructor   = "@constructor",
        CmpItemKindEnum          = "@enum",
        CmpItemKindEnumMember    = { link = "GruvboxAqua" },
        CmpItemKindEvent         = { fg = c.unknown2 },
        CmpItemKindField         = "@variable.member",
        CmpItemKindFile          = { link = "GruvboxBlue" },
        CmpItemKindFolder        = "Directory",
        CmpItemKindFunction      = "@function",
        CmpItemKindInterface     = "@type",
        CmpItemKindKeyword       = "@keyword",
        CmpItemKindMethod        = "@function.method",
        CmpItemKindModule        = "@module",
        CmpItemKindOperator      = "@operator",
        CmpItemKindProperty      = "@property",
        CmpItemKindReference     = { fg = c.unknown },
        CmpItemKindSnippet       = "@string",
        CmpItemKindStruct        = { link = "GruvboxYellow" },
        CmpItemKindText          = { link = "GruvboxOrange" },
        CmpItemKindTypeParameter = { link = "GruvboxYellow" },
        CmpItemKindValue         = { fg = c.unknown2 },
        CmpItemKindVariable      = "@variable",
        CmpItemMenu              = "Normal",
    }
end

return Cmp
