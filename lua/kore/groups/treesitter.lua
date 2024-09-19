local M = {}

---@type kore.HighlightsFn
function M.get(c, opts)
    -- stylua: ignore
    local ret = {
        -- ["@annotation"]                 = "PreProc",
        -- ["@attribute"]                  = "PreProc",
        -- ["@boolean"]                    = "Boolean",

        ["@character"]             = "String",  -- characters (i.e. 'a')
        -- ["@character.printf"]           = "SpecialChar",
        ["@character.special"]     = "Keyword", -- special characters (i.e. '*' in .gitignore)

        ["@comment"]               = "Comment",
        ["@comment.documentation"] = { fg = c.foreground_dark },
        -- ["@comment.error"]              = { fg = c.error },
        -- ["@comment.hint"]               = { fg = c.hint },
        -- ["@comment.info"]               = { fg = c.info },
        -- ["@comment.note"]               = { fg = c.hint },
        -- ["@comment.todo"]               = { fg = c.green },
        -- ["@comment.warning"]            = { fg = c.warning },

        ["@constant"]              = "Constant",
        ["@constant.builtin"]      = "Constant",
        -- ["@constant.macro"]             = "Define",

        ["@constructor"]           = "Type", -- constructor calls (i.e. javascipt)
        -- ["@constructor.tsx"]            = { fg = c.magenta },

        -- ["@diff.delta"]                 = "DiffChange",
        -- ["@diff.minus"]                 = "DiffDelete",
        -- ["@diff.plus"]                  = "DiffAdd",

        ["@function"]              = "Function", -- function names
        ["@function.builtin"]      = "Function", -- built in language functions
        -- ["@function.call"]              = "@function",
        -- ["@function.macro"]             = "Macro",
        ["@function.method"]       = "Function", -- function method calls
        -- ["@function.method.call"]       = "@function.method",

        ["@keyword"]               = "Keyword", -- general keywords
        -- ["@keyword.conditional"]        = "Conditional",
        -- ["@keyword.coroutine"]          = "@keyword",
        -- ["@keyword.debug"]              = "Debug",
        -- ["@keyword.directive"]          = "PreProc",
        -- ["@keyword.directive.define"]   = "Define",
        -- ["@keyword.exception"]          = "Exception",
        ["@keyword.function"]      = "Keyword", -- function defintion keywords
        ["@keyword.import"]        = "Keyword", -- package, module imports (i.e. import)
        ["@keyword.modifier"]      = "Keyword", -- modifier keywords (i.e. public, static, private, etc.)
        -- ["@keyword.operator"]           = "@operator",
        ["@keyword.repeat"]        = "Keyword", -- repeat keywords (i.e. for, while, etc.)
        ["@keyword.return"]        = "Keyword", -- return keyword
        -- ["@keyword.storage"]            = "StorageClass",
        ["@keyowrd.type"]          = "Keyword", -- type keywords (i.e. class, etc.)

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

        ["@number"]                = "Number",
        ["@number.float"]          = "Float",

        ["@operator"]              = "Operator",        -- operators (i.e. "+", "=", "...", etc.)

        ["@property"]              = "Identifier",      -- class properties

        ["@punctuation.bracket"]   = "Delimiter",       -- brackets and parenthesis (i.e. "[", "{", "(", etc.)
        ["@punctuation.delimiter"] = "Delimiter",       -- delimiters (i.e: ".")
        ["@punctuation.special"]   = { fg = c.senary }, -- special puncation (i.e. `${}` for template literals)

        ["@spell"]                 = "Comment",

        ["@string"]                = "String",             -- general strings
        ["@string.documentation"]  = "String",             -- strings in documentation
        ["@string.escape"]         = "Function",           -- escape characters within a string
        ["@string.regexp"]         = { fg = c.septenary }, -- regex strings
        ["@string.special"]        = "Identifier",         -- special strings (i.e. .gitignore paths)

        ["@tag"]                   = "Keyword",
        ["@tag.attribute"]         = { fg = c.senary },
        ["@tag.builtin"]           = "Keyword",
        ["@tag.delimiter"]         = "Keyword",
        -- ["@tag.delimiter.tsx"]          = "Delimiter",
        -- ["@tag.tsx"]                    = { fg = c.red },
        -- ["@tag.javascript"]             = { fg = c.red },

        ["@type"]                  = "Type", -- classes and non-primitive data types (i.e. String, etc.)
        ["@type.builtin"]          = "Type", -- primitve data types (i.e. int, float, char, etc.)
        -- ["@type.definition"]            = "Typedef",
        -- ["@type.qualifier"]             = "@keyword",

        ["@variable"]              = "Identifier",         -- general variables
        ["@variable.builtin"]      = { fg = c.septenary }, -- Variable names that are defined by the languages, like `this` or `self`.
        ["@variable.member"]       = "Identifier",         -- class fields
        ["@variable.parameter"]    = "Identifier",         -- function parameters
        -- ["@variable.parameter.builtin"] = "MoreMsg", -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]
    }
	return ret
end

return M
