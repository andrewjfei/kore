local WhichKey = {}

WhichKey.url = "https://github.com/folke/which-key.nvim"

--- @param c Colours
function WhichKey.get(c)
    -- stylua: ignore
    return {
        WhichKey          = "Identifier",
        WhichKeyGroup     = "Keyword",
        WhichKeyDesc      = "Identifier",
        WhichKeySeparator = "Comment",
        WhichKeyNormal    = "NormalFloat",
        WhichKeyValue     = { fg = c.unknown },
    }
end

return WhichKey
