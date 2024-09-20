local Lazy = {}

Lazy.url = "https://github.com/folke/lazy.nvim"

--- @param c Colours
function Lazy.get(c)
    -- stylua: ignore
    return {
        LazyCommit = "LazySpecial",
        LazyCommitIssue = { fg = c.quinary },
        LazyCommitType = { fg = c.foreground },
        LazyDimmed = { fg = c.foreground_dark },
        LazyProgressDone = { fg = c.primary, bold = true },
        LazyProgressTodo = { fg = c.buffer, bold = true },
        LazyProp = "LazyDimmed",
        LazySpecial = { fg = c.primary },
        LazyReasonEvent = { fg = c.primary },
        LazyReasonFt = { fg = c.tertiary },
        LazyReasonPlugin = { fg = c.secondary },
        LazyReasonSource = { fg = c.quaternary },
    }
end

return Lazy
