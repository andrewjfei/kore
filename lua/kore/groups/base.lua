local Base = {}

--- @param c Colours
function Base.get(c)
    -- stylua: ignore
    return {
        -- vim
        Comment                     = { fg = c.comment },                                       -- comment
        ColorColumn                 = { bg = c.primary },                                       -- column colour used for ruler, etc.
        Conceal                     = "EndOfBuffer",                                            -- placeholder characters substituted for concealed text (i.e. markdown)
        Cursor                      = { fg = c.background, bg = c.foreground, bold = true },    -- character under cursor
        lCursor                     = "Cursor",                                                 -- character under cursor
        CursorIM                    = "Cursor",                                                 -- character under cursor
        CursorColumn                = "CursorLine",                                             -- column of cursor
        CursorLine                  = "CursorLine",                                             -- row/line of cursor
        Directory                   = { fg = c.secondary },                                     -- directory colour
        DiffAdd                     = { fg = c.background_light, bg = c.success, bold = true }, -- diff added line
        DiffChange                  = { fg = c.background_light, bg = c.info, bold = true },    -- diff changed line
        DiffDelete                  = { fg = c.background_light, bg = c.error, bold = true },   -- diff deleted line
        DiffText                    = { fg = c.background_light, bg = c.comment, bold = true }, -- diff text changed in line
        EndOfBuffer                 = { fg = c.buffer },                                        -- filler lines (i.e. ~) in line number column
        ErrorMsg                    = "DiagnosticError",                                        -- error messages in the command line
        VertSplit                   = "SpecialKey",                                             -- line separating split windows
        WinSeparator                = "SpecialKey",                                             -- line separating split windows
        Folded                      = { fg = c.primary, bg = c.background_light, bold = true }, -- closed folds
        FoldColumn                  = { fg = c.unknown2, bg = c.unknown },                      -- unsure
        SignColumn                  = "Comment",                                                -- sign column beside line number column
        SignColumnSB                = { fg = c.unknown, bg = c.unknown3 },                      -- sign column beside line number column
        Substitute                  = { fg = c.background_light, bg = c.primary, bold = true }, -- string which will be substituted/replaced
        LineNr                      = "Comment",                                                -- line number column
        CursorLineNr                = "SpecialKey",                                             -- cursor line number column
        LineNrAbove                 = "LineNr",                                                 -- line numbers above cursor line
        LineNrBelow                 = "LineNr",                                                 -- line numbers below cursor line
        MatchParen                  = { fg = c.background, bg = c.primary, bold = true },       -- matching parenthesis of parenthesis under cursor
        ModeMsg                     = { fg = c.foreground },                                    -- mode messages (i.e. "-- INSERT --")
        MsgArea                     = "ModeMsg",                                                -- messages and command line
        MoreMsg                     = "ModeMsg",                                                -- more message prompt
        NonText                     = "Comment",                                                -- text (i.e. "@@@")
        Normal                      = { fg = c.foreground, bg = c.background },                 -- normal text
        NormalNC                    = "Normal",                                                 -- normal text in non-current window
        NormalSB                    = { fg = c.unknown2 },                                      -- normal text in sidebar
        NormalFloat                 = { fg = c.foreground, bg = c.background_light },           -- normal text in floating window
        -- FloatBorder                 = { fg = c.magenta, bg = c.cyan },                           -- floating window border
        -- FloatTitle                  = { fg = c.cyan, bg = c.red },                               -- floating window title
        Pmenu                       = "NormalFloat",                                             -- popup menu item
        PmenuSel                    = "Substitute",                                              -- popup menu selected item
        PmenuSbar                   = { bg = c.background_light },                               -- popup menu scrollbar
        PmenuThumb                  = "VisualNOS",                                               -- popup menu scrollbar thumb
        Question                    = "ModeMsg",                                                 -- question prompts in command line
        -- QuickFixLine                = { bg = c.cyan, bold = true },                              -- unsure
        Search                      = { fg = c.background_light, bg = c.tertiary, bold = true }, -- unselected searched string
        IncSearch                   = "Substitute",                                              -- included search string
        CurSearch                   = "IncSearch",                                               -- selected search string
        SpecialKey                  = { fg = c.primary },                                        -- unprintable characters
        SpellBad                    = { sp = c.error, undercurl = true },                        -- unrecognised word
        SpellCap                    = { sp = c.warning, undercurl = true },                      -- incorrect word capitalisation
        SpellLocal                  = { sp = c.info, undercurl = true },                         -- word recognised as used by another region
        SpellRare                   = { sp = c.hint, undercurl = true },                         -- word that is rarely used
        StatusLine                  = { fg = c.background_light, bg = c.primary, bold = true },  -- status line of current window
        StatusLineNC                = { fg = c.background_light, bg = c.comment, bold = true },  -- status line of not-current window
        TabLine                     = { fg = c.comment, bg = c.background },                     -- inactive tab label
        TabLineFill                 = { bg = c.background },                                     -- tab area background (i.e. where there are no tabs)
        TabLineSel                  = { fg = c.background_light, bg = c.primary, bold = true },  -- active tab label
        Title                       = { fg = c.primary, bold = true },                           -- output titles
        Visual                      = { bg = c.buffer },                                         -- visual mode selection
        -- VisualNOS                   = { bg = c.comment },                                        -- unowned visual mode selection
        WarningMsg                  = { fg = c.warning },                                        -- warning message
        Whitespace                  = { fg = c.background_light },                               -- whitespace characters
        -- WildMenu                    = { bg = c.magenta },                                        -- wild menu match
        -- WinBar                      = "StatusLine",                                              -- window bar
        -- WinBarNC                    = "StatusLineNC",                                            -- window bar in non-current window

        Boolean                     = "Constant",            -- booleans (i.e. true, false)
        Bold                        = { bold = true },       -- bold text
        Character                   = "String",              -- character (i.e. 'c', etc.)
        Constant                    = { fg = c.quinary },    -- constants (i.e. numbers, booleans, etc.)
        -- Debug                       = { fg = c.red },                                            -- debugging statements
        Delimiter                   = "Identifier",          -- character that needs attention
        Error                       = { fg = c.septenary },  -- error
        Float                       = "Constant",            -- decimals (i.e. doubles, floats, etc.)
        Function                    = { fg = c.secondary },  -- function and methods
        Identifier                  = { fg = c.foreground }, -- variable
        -- Italic                      = { italic = true, fg = c.fg },                              -- italic text
        Keyword                     = { fg = c.primary },    -- keywords
        Number                      = "Constant",            -- integers
        Operator                    = "Keyword",             -- operators (i.e. "+", "*", etc.)
        -- PreProc                     = { fg = c.senary },                                         -- preprocessors
        -- Special                     = "SpecialKey",                                              -- special symbols
        -- Statement                   = "SpecialKey",                                              -- statements
        String                      = { fg = c.tertiary },   -- string
        -- Todo                        = { bg = c.red, fg = c.bg },                                 -- to-do comments (i.e. TODO, FIXME, etc.)
        Type                        = { fg = c.quaternary }, -- data types (i.e. int, long, float, etc.)
        Underlined                  = { underline = true },  -- underlined text (i.e. links, etc.)
        -- debugBreakpoint             = { fg = c.red, bg = c.red, },                               -- debug breakpoint
        -- debugPC                     = { bg = c.cyan },                                           -- highlight current line in debug terminal
        -- dosIniLabel                 = "@property",
        -- helpCommand                 = { bg = c.terminal_black, fg = c.blue },
        -- htmlH1                      = { fg = c.magenta, bold = true },
        -- htmlH2                      = { fg = c.blue, bold = true },
        -- qfFileName                  = { fg = c.blue },
        -- qfLineNr                    = { fg = c.dark5 },

        -- These groups are for the native LSP client. Some other LSP clients may
        -- use these groups, or use their own.
        LspReferenceText            = "Visual", -- used for highlighting "text" references
        LspReferenceRead            = "Visual", -- used for highlighting "read" references
        LspReferenceWrite           = "Visual", -- used for highlighting "write" references
        LspSignatureActiveParameter = { bg = c.unknown3, bold = true },
        LspCodeLens                 = "Comment",
        LspInlayHint                = { bg = c.unknown2, fg = c.unknown },
        LspInfoBorder               = { fg = c.unknown, bg = c.unknown3 },

        -- git differences
        Added                       = { fg = c.success },
        Removed                     = { fg = c.error },
        Changed                     = { fg = c.info },

        -- diagnostics
        DiagnosticOk                = { fg = c.success },                   -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticError             = { fg = c.error },                     -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticWarn              = { fg = c.warning },                   -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticInfo              = { fg = c.info },                      -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticHint              = { fg = c.hint },                      -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticUnnecessary       = { fg = c.comment },                   -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticVirtualTextError  = "DiagnosticError",                    -- Used for "Error" diagnostic virtual text
        DiagnosticVirtualTextWarn   = "DiagnosticWarn",                     -- Used for "Warning" diagnostic virtual text
        DiagnosticVirtualTextInfo   = "DiagnosticInfo",                     -- Used for "Information" diagnostic virtual text
        DiagnosticVirtualTextHint   = "DiagnosticHint",
        DiagnosticUnderlineError    = { undercurl = true, sp = c.error },   -- Used to underline "Error" diagnostics
        DiagnosticUnderlineWarn     = { undercurl = true, sp = c.warning }, -- Used to underline "Warning" diagnostics
        DiagnosticUnderlineInfo     = { undercurl = true, sp = c.info },    -- Used to underline "Information" diagnostics
        DiagnosticUnderlineHint     = { undercurl = true, sp = c.hint },    -- Used to underline "Hint" diagnostics

        -- Health
        -- healthError                 = { fg = c.error },
        -- healthSuccess               = { fg = c.success },
        -- healthWarning               = { fg = c.warning },
    }
end

return Base
