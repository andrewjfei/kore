local M = {}

---@type kore.HighlightsFn
function M.get(c, opts)
    -- stylua: ignore
    local ret = {
        -- ["@annotation"]                 = "PreProc",
        -- ["@attribute"]                  = "PreProc",
        -- ["@boolean"]                    = "Boolean",
        ["@character"]            = "String", -- characters (i.e. 'a')
        -- ["@character.printf"]           = "SpecialChar",
        -- ["@character.special"]          = "SpecialChar",
        -- ["@comment"]                    = "Comment",
        -- ["@comment.error"]              = { fg = c.error },
        -- ["@comment.hint"]               = { fg = c.hint },
        -- ["@comment.info"]               = { fg = c.info },
        -- ["@comment.note"]               = { fg = c.hint },
        -- ["@comment.todo"]               = { fg = c.green },
        -- ["@comment.warning"]            = { fg = c.warning },
        -- ["@constant"]                   = "Constant",
        -- ["@constant.builtin"]           = "Special",
        -- ["@constant.macro"]             = "Define",
        ["@constructor"]          = "Type", -- constructor calls (i.e. javascipt)
        -- ["@constructor.tsx"]            = { fg = c.magenta },
        -- ["@diff.delta"]                 = "DiffChange",
        -- ["@diff.minus"]                 = "DiffDelete",
        -- ["@diff.plus"]                  = "DiffAdd",
        ["@function"]             = "Function", -- function names
        -- ["@function.builtin"]           = "Function",
        -- ["@function.call"]              = "@function",
        -- ["@function.macro"]             = "Macro",
        ["@function.method"]      = "Function", -- function method calls
        -- ["@function.method.call"]       = "@function.method",
        ["@keyword"]              = "Keyword",  -- general keywords
        -- ["@keyword.conditional"]        = "Conditional",
        -- ["@keyword.coroutine"]          = "@keyword",
        -- ["@keyword.debug"]              = "Debug",
        -- ["@keyword.directive"]          = "PreProc",
        -- ["@keyword.directive.define"]   = "Define",
        -- ["@keyword.exception"]          = "Exception",
        ["@keyword.function"]     = "Keyword", -- function defintion keywords
        ["@keyword.import"]       = "Keyword", -- package, module imports (i.e. import)
        -- ["@keyword.operator"]           = "@operator",
        ["@keyword.repeat"]       = "Keyword", -- repeat keywords (i.e. for, while, etc.)
        -- ["@keyword.return"]             = "@keyword",
        -- ["@keyword.storage"]            = "StorageClass",
        -- ["@label"]                      = { fg = c.red }, -- For labels: `label:` in C and `:label:` in Lua.
        -- ["@markup"]                     = "@none",
        -- ["@markup.emphasis"]            = { italic = true },
        -- ["@markup.environment"]         = "Macro",
        -- ["@markup.environment.name"]    = "Type",
        -- ["@markup.heading"]             = "Title",
        -- ["@markup.italic"]              = { italic = true },
        -- ["@markup.link"]                = { fg = c.red },
        -- ["@markup.link.label"]          = "SpecialChar",
        -- ["@markup.link.label.symbol"]   = "Identifier",
        -- ["@markup.link.url"]            = "Underlined",
        -- ["@markup.list"]                = { fg = c.red }, -- For special punctutation that does not fall in the categories before.
        -- ["@markup.list.checked"]        = "MoreMsg", -- For brackets and parens.
        -- ["@markup.list.markdown"]       = { fg = c.orange, bold = true },
        -- ["@markup.list.unchecked"]      = "MoreMsg", -- For brackets and parens.
        -- ["@markup.math"]                = "Special",
        -- ["@markup.raw"]                 = "String",
        -- ["@markup.raw.markdown_inline"] = { bg = c.terminal_black, fg = c.blue },
        -- ["@markup.strikethrough"]       = { strikethrough = true },
        -- ["@markup.strong"]              = { bold = true },
        -- ["@markup.underline"]           = { underline = true },
        -- ["@module"]                     = "Include",
        -- ["@module.builtin"]             = "MoreMsg", -- Variable names that are defined by the languages, like `this` or `self`.
        -- ["@namespace.builtin"]          = "Special",
        -- ["@none"]                       = {},
        -- ["@number"]                     = "Number",
        -- ["@number.float"]               = "Float",
        ["@operator"]             = "Operator", -- operators (i.e. "+", "=", etc.)
        -- ["@property"]                   = "Identifier",
        -- ["@punctuation.bracket"]        = "Delimiter", -- For brackets and parens.
        -- ["@punctuation.delimiter"]      = "Delimiter", -- For delimiters ie: `.`
        -- ["@punctuation.special"]        = "MoreMsg", -- For special symbols (e.g. `{}` in string interpolation)
        ["@string"]               = "String",             -- general strings
        ["@string.documentation"] = "String",             -- strings in documentation
        ["@string.escape"]        = { fg = c.secondary }, -- escape characters within a string
        ["@string.regexp"]        = { fg = c.septenary }, -- regex strings
        -- ["@tag"]                        = "Label",
        -- ["@tag.attribute"]              = "@property",
        -- ["@tag.delimiter"]              = "Delimiter",
        -- ["@tag.delimiter.tsx"]          = "Delimiter",
        -- ["@tag.tsx"]                    = { fg = c.red },
        -- ["@tag.javascript"]             = { fg = c.red },
        ["@type"]                 = "Type", -- classes and non-primitive data types (i.e. String, etc.)
        ["@type.builtin"]         = "Type", -- primitve data types (i.e. int, float, char, etc.)
        -- ["@type.definition"]            = "Typedef",
        -- ["@type.qualifier"]             = "@keyword",
        -- ["@variable"]                   = "MoreMsg", -- Any variable name that does not have another highlight.
        -- ["@variable.builtin"]           = "MoreMsg", -- Variable names that are defined by the languages, like `this` or `self`.
        -- ["@variable.member"]            = "MoreMsg", -- For fields.
        -- ["@variable.parameter"]         = "MoreMsg", -- For parameters of a function.
        -- ["@variable.parameter.builtin"] = "MoreMsg", -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]
    }

	-- for i, color in ipairs(c.rainbow) do
	--   ret["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
	-- end
	return ret
end

return M
