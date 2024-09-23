local Treesitter = {}

---@param c Colours
function Treesitter.get(c)
    -- stylua: ignore
    local ret = {
        -- ["@annotation"]                 = "PreProc",
        -- ["@attribute"]                  = "PreProc",
        -- ["@boolean"]                    = "Boolean",

        ["@character"]             = "String",  -- characters (i.e. 'a')
        -- ["@character.printf"]           = "SpecialChar",
        ["@character.special"]     = "Keyword", -- special characters (i.e. '*' in .gitignore)

        ["@comment"]               = "Comment",
        ["@comment.documentation"] = "Comment",
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
        ["@keyword.type"]          = "Keyword", -- type keywords (i.e. class, etc.)

        -- ["@label"]                      = { fg = c.red }, -- For labels: `label:` in C and `:label:` in Lua.
        -- ["@markup"]                     = "@none",
        -- ["@markup.emphasis"]            = { italic = true },
        -- ["@markup.environment"]         = "Macro",
        -- ["@markup.environment.name"]    = "Type",
        -- ["@markup.heading"]             = "Title",
        -- ["@markup.italic"]              = { italic = true },
        -- ["@markup.link"]                = { fg = c.red },
        ["@markup.link.label"]     = "Keyword",
        -- ["@markup.link.label.symbol"]   = "Identifier",
        ["@markup.link.url"]       = { fg = c.tertiary, underline = true },
        ["@markup.list"]           = "Keyword", -- For special punctutation that does not fall in the categories before.
        -- ["@markup.list.checked"]        = "MoreMsg", -- For brackets and parens.
        -- ["@markup.list.markdown"]       = { fg = c.orange, bold = true },
        -- ["@markup.list.unchecked"]      = "MoreMsg", -- For brackets and parens.
        -- ["@markup.math"]                = "Special",
        ["@markup.raw"]            = { fg = c.septenary },
        ["@markup.raw.block"]      = "Comment",
        -- ["@markup.raw.markdown_inline"] = { bg = c.terminal_black, fg = c.blue },
        ["@markup.strikethrough"]  = { strikethrough = true },
        ["@markup.strong"]         = "Bold",
        ["@markup.underline"]      = "Underlined",

        ["@module"]                     = "Keyword",
        ["@module.builtin"]        = { fg = c.septenary }, -- variable names deifned by the langauge (i.e. "this", "self", etc.)

        -- ["@namespace.builtin"]          = "Special",

        -- ["@none"]                       = {},

        -- ["@nospell"]               = { fg = c.septenary },

        ["@number"]                = "Number",
        ["@number.float"]          = "Float",

        ["@operator"]              = "Operator",        -- operators (i.e. "+", "=", "...", etc.)

        ["@property"]              = "Identifier",      -- class properties

        ["@punctuation.bracket"]   = "Delimiter",       -- brackets and parenthesis (i.e. "[", "{", "(", etc.)
        ["@punctuation.delimiter"] = "Delimiter",       -- delimiters (i.e: ".")
        ["@punctuation.special"]   = { fg = c.septenary }, -- special puncation (i.e. `${}` for template literals)

        ["@spell"]                 = "Identifier",

        ["@string"]                = "String",             -- general strings
        ["@string.documentation"]  = "String",             -- strings in documentation
        ["@string.escape"]         = "Function",           -- escape characters within a string
        ["@string.regexp"]         = { fg = c.septenary }, -- regex strings
        ["@string.special"]        = "Identifier",         -- special strings (i.e. .gitignore paths)

        ["@tag"]                   = "Keyword",
        ["@tag.attribute"]         = "Identifier",
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
        ["@variable.builtin"]      = { fg = c.septenary }, -- variable names deifned by the langauge (i.e. "this", "self", etc.)
        ["@variable.member"]       = "Identifier",         -- class fields
        ["@variable.parameter"]    = "Identifier",         -- function parameters
        -- ["@variable.parameter.builtin"] = "MoreMsg", -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]

        -- lua overrides
        ["@constant.lua"]          = "Identifier",

        -- markdown overrides
        ["@spell.markdown"]        = "Identifier"
    }
	return ret
end

return Treesitter
