---@class Kore
---@field config KoreConfig
---@field palette KorePalette
local Kore = {}

---@alias Contrast "hard" | "soft" | ""

---@class ItalicConfig
---@field strings boolean
---@field comments boolean
---@field operators boolean
---@field folds boolean
---@field emphasis boolean

---@class HighlightDefinition
---@field fg string?
---@field bg string?
---@field sp string?
---@field blend integer?
---@field bold boolean?
---@field standout boolean?
---@field underline boolean?
---@field undercurl boolean?
---@field underdouble boolean?
---@field underdotted boolean?
---@field strikethrough boolean?
---@field italic boolean?
---@field reverse boolean?
---@field nocombine boolean?

---@class KoreConfig
---@field terminal_colors boolean?
---@field undercurl boolean?
---@field underline boolean?
---@field bold boolean?
---@field italic ItalicConfig?
---@field strikethrough boolean?
---@field contrast Contrast?
---@field invert_selection boolean?
---@field invert_signs boolean?
---@field invert_tabline boolean?
---@field invert_intend_guides boolean?
---@field inverse boolean?
---@field overrides table<string, HighlightDefinition>?
---@field palette_overrides table<string, string>?
Kore.config = {
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true,
  contrast = "",
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
}

-- main kore color palette
---@class KorePalette
Kore.palette = {
  dark_dark = "#1d1d1d", -- background
  dark_normal = "#2d2d2d",
  dark_light = "#444444",
  dark3 = "#0000ff", -- to remove blue

  light_dark = "#747474",
  light_normal = "#b4b4b4",
  light_light = "#e4e4e4",
  light3 = "#ff0000", -- to remove red_normal
  light4 = "#00ff00", -- to remove green_normal

  red_dark = "#d94426",
  red_normal = "#ff7f66",
  red_light = "#ffbfb3",

  green_dark = "#63a145",
  green_normal = "#aacd98",
  green_light = "#d2ecc6",

  yellow_dark = "#e8ba30",
  yellow_normal = "#f2d98c",
  yellow_light = "#fff2cc",

  blue_dark = "#406abf",
  blue_normal = "#85a3e0",
  blue_light = "#c2d1f0",

  pink_dark = "#e05299",
  pink_normal = "#fa9ecc",
  pink_light = "#fccfe6",

  cyan_dark = "#2e9e95",
  cyan_normal = "#9cc9c6",
  cyan_light = "#c4eeea",

  orange_dark = "#ee7c2b",
  orange_normal = "#ffa666",
  orange_light = "#ffd2b3",

  gray = "#ffdd00", -- to remove yellow_normal
}

-- get a hex list of gruvbox colors based on current bg and constrast config
local function get_colors()
  local p = Kore.palette
  local config = Kore.config

  local bg = vim.o.background
  local contrast = config.contrast

  local color_groups = {
    dark = {
      background = p.dark_dark,
      dark_normal = p.dark_normal,
      dark_light = p.dark_light,
      bg3 = p.dark3,
      light_dark = p.light_dark,
      foreground = p.light_light,
      light_normal = p.light_normal,
      fg4 = p.light4,
      red_normal = p.red_normal,
      green_normal = p.green_normal,
      yellow_normal = p.yellow_normal,
      blue_normal = p.blue_normal,
      pink_normal = p.pink_normal,
      cyan_normal = p.cyan_normal,
      orange_normal = p.orange_normal,
      red_dark = p.red_dark,
      green_dark = p.green_dark,
      yellow_dark = p.yellow_dark,
      blue_dark = p.blue_dark,
      pink_dark = p.pink_dark,
      cyan_dark = p.cyan_dark,
      orange_dark = p.orange_dark,
      gray = p.gray,
    }
  }

  return color_groups["dark"]
end

local function get_groups()
  local colors = get_colors()
  local config = Kore.config

  if config.terminal_colors then
    local term_colors = {
      colors.dark_normal,
      colors.red_normal,
      colors.green_normal,
      colors.yellow_normal,
      colors.blue_normal,
      colors.pink_normal,
      colors.cyan_normal,
      colors.light_dark,
      colors.dark_light,
      colors.red_light,
      colors.green_light,
      colors.yellow_light,
      colors.blue_light,
      colors.pink_light,
      colors.cyan_light,
      colors.light_normal,
    }
    for index, value in ipairs(term_colors) do
      vim.g["terminal_color_" .. index - 1] = value
    end
  end

  local groups = {
    -- colour variables
    KoreFunction = { fg = colors.green_normal },
    KoreFg0 = { fg = colors.gray },
    KoreForeground = { fg = colors.foreground },
    KoreFg2 = { fg = colors.light_normal },
    KoreFg3 = { fg = colors.foreground },
    KoreFg4 = { fg = colors.orange_normal },
    KoreGray = { fg = colors.gray },
    KoreBackground = { fg = colors.background },
    KoreBg1 = { fg = colors.dark_normal },
    KoreComment = { fg = colors.light_dark },
    KoreBg3 = { fg = colors.bg3 },
    KoreBg4 = { fg = colors.light_dark },
    KoreRed = { fg = colors.red_normal },
    KoreRedBold = { fg = colors.red_normal, bold = config.bold },
    KoreGreen = { fg = colors.green_normal },
    KoreGreenBold = { fg = colors.green_normal, bold = config.bold },
    KoreYellow = { fg = colors.yellow_normal },
    KoreYellowBold = { fg = colors.yellow_normal, bold = config.bold },
    KoreBlue = { fg = colors.blue_normal },
    KoreBlueBold = { fg = colors.blue_normal, bold = config.bold },
    KorePink = { fg = colors.pink_normal },
    KorePinkBold = { fg = colors.pink_normal, bold = config.bold },
    KoreCyan = { fg = colors.cyan_normal },
    KoreCyanBold = { fg = colors.cyan_normal, bold = config.bold },
    KoreOrange = { fg = colors.orange_normal },
    KoreOrangeBold = { fg = colors.orange_normal, bold = config.bold },
    KoreRedSign = config.transparent_mode and { fg = colors.red_normal, reverse = config.invert_signs }
      or { fg = colors.red_normal, bg = colors.dark_normal, reverse = config.invert_signs },
    KoreGreenSign = config.transparent_mode and { fg = colors.green_normal, reverse = config.invert_signs }
      or { fg = colors.green_normal, bg = colors.dark_normal, reverse = config.invert_signs },
    KoreYellowSign = config.transparent_mode and { fg = colors.yellow_normal, reverse = config.invert_signs }
      or { fg = colors.yellow_normal, bg = colors.dark_normal, reverse = config.invert_signs },
    KoreBlueSign = config.transparent_mode and { fg = colors.blue_normal, reverse = config.invert_signs }
      or { fg = colors.blue_normal, bg = colors.dark_normal, reverse = config.invert_signs },
    KorePinkSign = config.transparent_mode and { fg = colors.pink_normal, reverse = config.invert_signs }
      or { fg = colors.pink_normal, bg = colors.dark_normal, reverse = config.invert_signs },
    KoreCyanSign = config.transparent_mode and { fg = colors.cyan_normal, reverse = config.invert_signs }
      or { fg = colors.cyan_normal, bg = colors.dark_normal, reverse = config.invert_signs },
    KoreOrangeSign = config.transparent_mode and { fg = colors.orange_normal, reverse = config.invert_signs }
      or { fg = colors.orange_normal, bg = colors.dark_normal, reverse = config.invert_signs },
    KoreRedUnderline = { undercurl = config.undercurl, sp = colors.red_normal },
    KoreGreenUnderline = { undercurl = config.undercurl, sp = colors.green_normal },
    KoreYellowUnderline = { undercurl = config.undercurl, sp = colors.yellow_normal },
    KoreBlueUnderline = { undercurl = config.undercurl, sp = colors.blue_normal },
    KorePinkUnderline = { undercurl = config.undercurl, sp = colors.pink_normal },
    KoreCyanUnderline = { undercurl = config.undercurl, sp = colors.cyan_normal },
    KoreOrangeUnderline = { undercurl = config.undercurl, sp = colors.orange_normal },
    KoreLightUnderline = { undercurl = config.undercurl, sp = colors.foreground },

    -- vim
    Normal = { fg = colors.foreground, bg = colors.background }, -- basic foreground and background
    NormalFloat = config.transparent_mode and { fg = colors.foreground, bg = nil } or { fg = colors.foreground, bg = colors.dark_normal }, -- floating windows
    NormalNC = config.dim_inactive and { fg = colors.gray, bg = colors.dark_normal } or { link = "Normal" }, -- normal text it non-current windows
    CursorLine = { bg = colors.dark_normal }, -- background for line under cursor
    CursorColumn = { link = "CursorLine" }, 
    TabLineFill = { fg = colors.light_dark, bg = colors.dark_normal, reverse = config.invert_tabline },
    TabLineSel = { fg = colors.green_normal, bg = colors.dark_normal, reverse = config.invert_tabline },
    TabLine = { link = "TabLineFill" },
    MatchParen = { fg = colors.background, bg = colors.orange_normal, bold = true },
    ColorColumn = { bg = colors.dark_normal },
    Conceal = { fg = colors.blue_normal },
    CursorLineNr = { fg = colors.yellow_normal, bg = colors.dark_normal },
    NonText = { link = "KoreComment" },
    SpecialKey = { link = "KoreFg4" },
    Visual = { bg = colors.dark_light, reverse = config.invert_selection },
    VisualNOS = { link = "Visual" },
    Search = { fg = colors.background, bg = colors.yellow_normal },
    IncSearch = { fg = colors.background, bg = colors.orange_normal },
    CurSearch = { link = "IncSearch" },
    QuickFixLine = { link = "KorePink" },
    Underlined = { fg = colors.blue_normal, underline = config.underline },
    StatusLine = { fg = colors.dark_light, bg = colors.foreground, reverse = config.inverse },
    StatusLineNC = { fg = colors.dark_normal, bg = colors.fg4, reverse = config.inverse },
    WinBar = { fg = colors.fg4, bg = colors.background },
    WinBarNC = { fg = colors.foreground, bg = colors.dark_normal },
    WinSeparator = { fg = colors.orange_normal, bg = nil },
    WildMenu = { fg = colors.blue_normal, bg = colors.dark_light, bold = config.bold },
    Directory = { link = "KoreGreenBold" },
    Title = { link = "KoreOrangeBold" },
    ErrorMsg = { fg = colors.foreground, bg = colors.red_normal, bold = config.bold },
    MoreMsg = { link = "KoreYellowBold" },
    ModeMsg = { link = "KoreYellowBold" },
    Question = { link = "KoreOrangeBold" },
    WarningMsg = { link = "KoreRedBold" },
    LineNr = { fg = colors.light_dark },
    SignColumn = config.transparent_mode and { bg = nil } or { bg = colors.dark_normal },
    Folded = { fg = colors.orange_normal, bg = colors.dark_normal },
    FoldColumn = { fg = colors.yellow_normal, bg = colors.dark_normal },
    Cursor = { reverse = config.inverse },
    vCursor = { link = "Cursor" },
    iCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    Special = { link = "KoreOrange" },
    Comment = { link = "KoreComment" },
    Todo = { fg = colors.yellow_normal, bold = true }, -- todo text in comments
    Done = { fg = colors.dark_normal, bg = colors.green_normal, bold = true },
    Error = { fg = colors.dark_normal, bg = colors.red_normal, bold = true },
    Statement = { link = "KoreOrange" },
    Conditional = { link = "KoreOrange" },
    Repeat = { link = "KoreOrange" },
    Label = { link = "KoreYellow" },
    Exception = { link = "KoreOrange" },
    Operator = { link = "KoreOrange" },
    Keyword = { link = "KoreOrange" },
    Identifier = { link = "KoreForegorund" },
    Function = { link = "KoreFunction" },
    PreProc = { link = "KorePink" },
    Include = { link = "KoreOrange" },
    Define = { link = "KoreCyan" }, -- used in langauges like c
    Macro = { link = "KoreCyan" }, -- used in languages like c
    PreCondit = { link = "KoreCyan" }, -- used in languages like c
    Constant = { link = "KorePink" },
    Character = { link = "KoreYellow" },
    String = { link = "KoreYellow" },
    Boolean = { link = "KoreBlue" },
    Number = { link = "KorePink" },
    Float = { link = "KorePink" },
    Type = { link = "KorePink" },
    StorageClass = { link = "KoreCyan" }, -- to change when encountered in c or rust
    Structure = { link = "KoreCyan" }, -- to change when encountered in c or rust
    Typedef = { link = "KoreCyan" }, -- to change when encountered in c or rust
    Pmenu = { fg = colors.foreground, bg = colors.dark_light },
    PmenuSel = { fg = colors.dark_light, bg = colors.orange_normal, bold = config.bold },
    PmenuSbar = { bg = colors.dark_light },
    PmenuThumb = { bg = colors.light_dark },
    DiffDelete = { fg = colors.dark_normal, bg = colors.red_normal, bold = true },
    DiffAdd = { fg = colors.dark_normal, bg = colors.green_normal, bold = true },
    DiffChange = { fg = colors.dark_normal, bg = colors.cyan_normal, bold = true },
    DiffText = { fg = colors.dark_normal, bg = colors.yellow_normal, bold = true },
    SpellCap = { link = "KoreOrangeUnderline" },
    SpellBad = { link = "KoreRedUnderline" },
    SpellLocal = { link = "KoreYellowUnderline" },
    SpellRare = { link = "KoreLightUnderline" },
    Whitespace = { fg = colors.dark_light },

    -- lsp
    -- Delimiter = { link = "KoreForeground" },
    -- EndOfBuffer = { link = "NonText" },
    -- DiagnosticError = { link = "KoreRed" },
    -- DiagnosticSignError = { link = "KoreRedSign" },
    -- DiagnosticUnderlineError = { link = "KoreRedUnderline" },
    -- DiagnosticWarn = { link = "KoreYellow" },
    -- DiagnosticSignWarn = { link = "KoreYellowSign" },
    -- DiagnosticUnderlineWarn = { link = "KoreYellowUnderline" },
    -- DiagnosticInfo = { link = "KoreBlue" },
    -- DiagnosticSignInfo = { link = "KoreBlueSign" },
    -- DiagnosticUnderlineInfo = { link = "KoreBlueUnderline" },
    -- DiagnosticHint = { link = "KoreCyan" },
    -- DiagnosticSignHint = { link = "KoreCyanSign" },
    -- DiagnosticUnderlineHint = { link = "KoreCyanUnderline" },
    -- DiagnosticFloatingError = { link = "KoreRed" },
    -- DiagnosticFloatingWarn = { link = "KoreOrange" },
    -- DiagnosticFloatingInfo = { link = "KoreBlue" },
    -- DiagnosticFloatingHint = { link = "KoreCyan" },
    -- DiagnosticVirtualTextError = { link = "KoreRed" },
    -- DiagnosticVirtualTextWarn = { link = "KoreYellow" },
    -- DiagnosticVirtualTextInfo = { link = "KoreBlue" },
    -- DiagnosticVirtualTextHint = { link = "KoreCyan" },
    -- DiagnosticOk = { link = "KoreGreenSign" },
    -- LspReferenceRead = { link = "KoreYellowBold" },
    -- LspReferenceText = { link = "KoreYellowBold" },
    -- LspReferenceWrite = { link = "KoreOrangeBold" },
    -- LspCodeLens = { link = "KoreGray" },
    -- LspSignatureActiveParameter = { link = "Search" },
    -- gitcommitSelectedFile = { link = "KoreGreen" },
    -- gitcommitDiscardedFile = { link = "KoreRed" },
    
    -- gitsigns
    -- GitSignsAdd = { link = "KoreGreen" },
    -- GitSignsChange = { link = "KoreOrange" },
    -- GitSignsDelete = { link = "KoreRed" },
    
    -- json
    -- jsonKeyword = { link = "KoreGreen" },
    -- jsonQuote = { link = "KoreGreen" },
    -- jsonBraces = { link = "KoreForeground" },
    -- jsonString = { link = "KoreForeground" },

    -- javascript
    -- javaScriptBraces = { link = "KoreForeground" },
    -- javaScriptFunction = { link = "KorePink" },
    -- javaScriptIdentifier = { link = "KoreOrange" },
    -- javaScriptMember = { link = "KoreCyan" },
    -- javaScriptNumber = { link = "KorePink" },
    -- javaScriptNull = { link = "KorePink" },
    -- javaScriptParens = { link = "KoreGreen" },

    -- typescript
    -- typescriptReserved = { link = "KoreCyan" },
    -- typescriptLabel = { link = "KoreCyan" },
    -- typescriptFuncKeyword = { link = "KoreCyan" },
    -- typescriptIdentifier = { link = "KoreOrange" },
    -- typescriptBraces = { link = "KoreForeground" },
    -- typescriptEndColons = { link = "KoreForeground" },
    -- typescriptDOMObjects = { link = "KoreForeground" },
    -- typescriptAjaxMethods = { link = "KoreForeground" },
    -- typescriptLogicSymbols = { link = "KoreForeground" },
    -- typescriptDocSeeTag = { link = "Comment" },
    -- typescriptDocParam = { link = "Comment" },
    -- typescriptDocTags = { link = "vimCommentTitle" },
    -- typescriptGlobalObjects = { link = "KoreForeground" },
    -- typescriptParens = { link = "KoreFg3" },
    -- typescriptOpSymbols = { link = "KoreFg3" },
    -- typescriptHtmlElemProperties = { link = "KoreForeground" },
    -- typescriptNull = { link = "KorePink" },
    -- typescriptInterpolationDelimiter = { link = "KoreCyan" },

    -- treesitter
    -- ["@comment"] = { link = "Comment" },
    -- ["@none"] = { bg = "NONE", fg = "NONE" },
    -- ["@preproc"] = { link = "PreProc" },
    -- ["@define"] = { link = "Define" },
    -- ["@operator"] = { link = "Operator" },
    -- ["@punctuation.delimiter"] = { link = "Delimiter" },
    -- ["@punctuation.bracket"] = { link = "Delimiter" },
    -- ["@punctuation.special"] = { link = "Delimiter" },
    -- ["@string"] = { link = "String" },
    -- ["@string.regex"] = { link = "String" },
    -- ["@string.regexp"] = { link = "String" },
    -- ["@string.escape"] = { link = "SpecialChar" },
    -- ["@string.special"] = { link = "SpecialChar" },
    -- ["@string.special.path"] = { link = "Underlined" },
    -- ["@string.special.symbol"] = { link = "Identifier" },
    -- ["@string.special.url"] = { link = "Underlined" },
    -- ["@character"] = { link = "Character" },
    -- ["@character.special"] = { link = "SpecialChar" },
    -- ["@boolean"] = { link = "Boolean" },
    -- ["@number"] = { link = "Number" },
    -- ["@number.float"] = { link = "Float" },
    -- ["@float"] = { link = "Float" },
    -- ["@function"] = { link = "Function" },
    -- ["@function.builtin"] = { link = "Special" },
    -- ["@function.call"] = { link = "Function" },
    -- ["@function.macro"] = { link = "Macro" },
    -- ["@function.method"] = { link = "Function" },
    -- ["@method"] = { link = "Function" },
    -- ["@method.call"] = { link = "Function" },
    -- ["@constructor"] = { link = "Special" },
    -- ["@parameter"] = { link = "Identifier" },
    -- ["@keyword"] = { link = "Keyword" },
    -- ["@keyword.conditional"] = { link = "Conditional" },
    -- ["@keyword.debug"] = { link = "Debug" },
    -- ["@keyword.directive"] = { link = "PreProc" },
    -- ["@keyword.directive.define"] = { link = "Define" },
    -- ["@keyword.exception"] = { link = "Exception" },
    -- ["@keyword.function"] = { link = "Keyword" },
    -- ["@keyword.import"] = { link = "Include" },
    -- ["@keyword.operator"] = { link = "Keyword" },
    -- ["@keyword.repeat"] = { link = "Repeat" },
    -- ["@keyword.return"] = { link = "Keyword" },
    -- ["@keyword.storage"] = { link = "StorageClass" },
    -- ["@conditional"] = { link = "Conditional" },
    -- ["@repeat"] = { link = "Repeat" },
    -- ["@debug"] = { link = "Debug" },
    -- ["@label"] = { link = "Label" },
    -- ["@include"] = { link = "Include" },
    -- ["@exception"] = { link = "Exception" },
    -- ["@type"] = { link = "Type" },
    -- ["@type.builtin"] = { link = "Type" },
    -- ["@type.definition"] = { link = "Typedef" },
    -- ["@type.qualifier"] = { link = "Type" },
    -- ["@storageclass"] = { link = "StorageClass" },
    -- ["@attribute"] = { link = "PreProc" },
    -- ["@field"] = { link = "Identifier" },
    -- ["@property"] = { link = "Identifier" },
    -- ["@variable"] = { link = "KoreForeground" },
    -- ["@variable.builtin"] = { link = "Special" },
    -- ["@variable.member"] = { link = "Identifier" },
    -- ["@variable.parameter"] = { link = "Identifier" },
    -- ["@constant"] = { link = "Constant" },
    -- ["@constant.builtin"] = { link = "Special" },
    -- ["@constant.macro"] = { link = "Define" },
    -- ["@markup"] = { link = "KoreForeground" },
    -- ["@markup.strong"] = { bold = config.bold },
    -- ["@markup.italic"] = { link = "@text.emphasis" },
    -- ["@markup.underline"] = { underline = config.underline },
    -- ["@markup.strikethrough"] = { strikethrough = config.strikethrough },
    -- ["@markup.heading"] = { link = "Title" },
    -- ["@markup.raw"] = { link = "String" },
    -- ["@markup.math"] = { link = "Special" },
    -- ["@markup.environment"] = { link = "Macro" },
    -- ["@markup.environment.name"] = { link = "Type" },
    -- ["@markup.link"] = { link = "Underlined" },
    -- ["@markup.link.label"] = { link = "SpecialChar" },
    -- ["@markup.list"] = { link = "Delimiter" },
    -- ["@markup.list.checked"] = { link = "KoreGreen" },
    -- ["@markup.list.unchecked"] = { link = "KoreGray" },
    -- ["@comment.todo"] = { link = "Todo" },
    -- ["@comment.note"] = { link = "SpecialComment" },
    -- ["@comment.warning"] = { link = "WarningMsg" },
    -- ["@comment.error"] = { link = "ErrorMsg" },
    -- ["@diff.plus"] = { link = "diffAdded" },
    -- ["@diff.minus"] = { link = "diffRemoved" },
    -- ["@diff.delta"] = { link = "diffChanged" },
    -- ["@module"] = { link = "KoreForeground" },
    -- ["@namespace"] = { link = "KoreForeground" },
    -- ["@symbol"] = { link = "Identifier" },
    -- ["@text"] = { link = "KoreForeground" },
    -- ["@text.strong"] = { bold = config.bold },
    -- ["@text.emphasis"] = { italic = config.italic.emphasis },
    -- ["@text.underline"] = { underline = config.underline },
    -- ["@text.strike"] = { strikethrough = config.strikethrough },
    -- ["@text.title"] = { link = "Title" },
    -- ["@text.literal"] = { link = "String" },
    -- ["@text.uri"] = { link = "Underlined" },
    -- ["@text.math"] = { link = "Special" },
    -- ["@text.environment"] = { link = "Macro" },
    -- ["@text.environment.name"] = { link = "Type" },
    -- ["@text.reference"] = { link = "Constant" },
    -- ["@text.todo"] = { link = "Todo" },
    -- ["@text.todo.checked"] = { link = "KoreGreen" },
    -- ["@text.todo.unchecked"] = { link = "KoreGray" },
    -- ["@text.note"] = { link = "SpecialComment" },
    -- ["@text.note.comment"] = { fg = colors.pink_normal, bold = config.bold },
    -- ["@text.warning"] = { link = "WarningMsg" },
    -- ["@text.danger"] = { link = "ErrorMsg" },
    -- ["@text.danger.comment"] = { fg = colors.gray, bg = colors.red_normal, bold = config.bold },
    -- ["@text.diff.add"] = { link = "diffAdded" },
    -- ["@text.diff.delete"] = { link = "diffRemoved" },
    -- ["@tag"] = { link = "Tag" },
    -- ["@tag.attribute"] = { link = "Identifier" },
    -- ["@tag.delimiter"] = { link = "Delimiter" },
    -- ["@punctuation"] = { link = "Delimiter" },
    -- ["@macro"] = { link = "Macro" },
    -- ["@structure"] = { link = "Structure" },
    -- ["@lsp.type.class"] = { link = "@type" },
    -- ["@lsp.type.comment"] = { link = "@comment" },
    -- ["@lsp.type.decorator"] = { link = "@macro" },
    -- ["@lsp.type.enum"] = { link = "@type" },
    -- ["@lsp.type.enumMember"] = { link = "@constant" },
    -- ["@lsp.type.function"] = { link = "@function" },
    -- ["@lsp.type.interface"] = { link = "@constructor" },
    -- ["@lsp.type.macro"] = { link = "@macro" },
    -- ["@lsp.type.method"] = { link = "@method" },
    -- ["@lsp.type.namespace"] = { link = "@namespace" },
    -- ["@lsp.type.parameter"] = { link = "@parameter" },
    -- ["@lsp.type.property"] = { link = "@property" },
    -- ["@lsp.type.struct"] = { link = "@type" },
    -- ["@lsp.type.type"] = { link = "@type" },
    -- ["@lsp.type.typeParameter"] = { link = "@type.definition" },
    -- ["@lsp.type.variable"] = { link = "@variable" },

    -- telescope
    -- TelescopeNormal = { link = "KoreForeground" },
    -- TelescopeSelection = { link = "KoreOrangeBold" },
    -- TelescopeSelectionCaret = { link = "KoreRed" },
    -- TelescopeMultiSelection = { link = "KoreGray" },
    -- TelescopeBorder = { link = "TelescopeNormal" },
    -- TelescopePromptBorder = { link = "TelescopeNormal" },
    -- TelescopeResultsBorder = { link = "TelescopeNormal" },
    -- TelescopePreviewBorder = { link = "TelescopeNormal" },
    -- TelescopeMatching = { link = "KoreBlue" },
    -- TelescopePromptPrefix = { link = "KoreRed" },
    -- TelescopePrompt = { link = "TelescopeNormal" },

    -- cmp
    -- CmpItemAbbr = { link = "KoreFg0" },
    -- CmpItemAbbrDeprecated = { link = "KoreForeground" },
    -- CmpItemAbbrMatch = { link = "KoreBlueBold" },
    -- CmpItemAbbrMatchFuzzy = { link = "KoreBlueUnderline" },
    -- CmpItemMenu = { link = "KoreGray" },
    -- CmpItemKindText = { link = "KoreOrange" },
    -- CmpItemKindVariable = { link = "KoreOrange" },
    -- CmpItemKindMethod = { link = "KoreBlue" },
    -- CmpItemKindFunction = { link = "KoreBlue" },
    -- CmpItemKindConstructor = { link = "KoreYellow" },
    -- CmpItemKindUnit = { link = "KoreBlue" },
    -- CmpItemKindField = { link = "KoreBlue" },
    -- CmpItemKindClass = { link = "KoreYellow" },
    -- CmpItemKindInterface = { link = "KoreYellow" },
    -- CmpItemKindModule = { link = "KoreBlue" },
    -- CmpItemKindProperty = { link = "KoreBlue" },
    -- CmpItemKindValue = { link = "KoreOrange" },
    -- CmpItemKindEnum = { link = "KoreYellow" },
    -- CmpItemKindOperator = { link = "KoreYellow" },
    -- CmpItemKindKeyword = { link = "KorePink" },
    -- CmpItemKindEvent = { link = "KorePink" },
    -- CmpItemKindReference = { link = "KorePink" },
    -- CmpItemKindColor = { link = "KorePink" },
    -- CmpItemKindSnippet = { link = "KoreGreen" },
    -- CmpItemKindFile = { link = "KoreBlue" },
    -- CmpItemKindFolder = { link = "KoreBlue" },
    -- CmpItemKindEnumMember = { link = "KoreCyan" },
    -- CmpItemKindConstant = { link = "KoreOrange" },
    -- CmpItemKindStruct = { link = "KoreYellow" },
    -- CmpItemKindTypeParameter = { link = "KoreYellow" },

    -- diff
    -- diffAdded = { link = "DiffAdd" },
    -- diffRemoved = { link = "DiffDelete" },
    -- diffChanged = { link = "DiffChange" },
    -- diffFile = { link = "KoreOrange" },
    -- diffNewFile = { link = "KoreYellow" },
    -- diffOldFile = { link = "KoreOrange" },
    -- diffLine = { link = "KoreBlue" },
    -- diffIndexLine = { link = "diffChanged" },
        
    -- mason    
    -- MasonHighlight = { link = "KoreCyan" },
    -- MasonHighlightBlock = { fg = colors.background, bg = colors.blue_normal },
    -- MasonHighlightBlockBold = { fg = colors.background, bg = colors.blue_normal, bold = true },
    -- MasonHighlightSecondary = { fg = colors.yellow_normal },
    -- MasonHighlightBlockSecondary = { fg = colors.background, bg = colors.yellow_normal },
    -- MasonHighlightBlockBoldSecondary = { fg = colors.background, bg = colors.yellow_normal, bold = true },
    -- MasonHeader = { link = "MasonHighlightBlockBoldSecondary" },
    -- MasonHeaderSecondary = { link = "MasonHighlightBlockBold" },
    -- MasonMuted = { fg = colors.fg4 },
    -- MasonMutedBlock = { fg = colors.background, bg = colors.fg4 },
    -- MasonMutedBlockBold = { fg = colors.background, bg = colors.fg4, bold = true },

    -- nvimtree		
    -- NvimTreeSymlink = { fg = colors.cyan_dark },
    -- NvimTreeRootFolder = { fg = colors.pink_dark, bold = true },
    -- NvimTreeFolderIcon = { fg = colors.blue_dark, bold = true },
    -- NvimTreeFileIcon = { fg = colors.light_light },
    -- NvimTreeExecFile = { fg = colors.green_dark, bold = true },
    -- NvimTreeOpenedFile = { fg = colors.red_normal, bold = true },
    -- NvimTreeSpecialFile = { fg = colors.yellow_dark, bold = true, underline = true },
    -- NvimTreeImageFile = { fg = colors.pink_dark },
    -- NvimTreeIndentMarker = { fg = colors.dark3 },
    -- NvimTreeGitDirty = { fg = colors.yellow_dark },
    -- NvimTreeGitStaged = { fg = colors.yellow_dark },
    -- NvimTreeGitMerge = { fg = colors.pink_dark },
    -- NvimTreeGitRenamed = { fg = colors.pink_dark },
    -- NvimTreeGitNew = { fg = colors.yellow_dark },
    -- NvimTreeGitDeleted = { fg = colors.red_dark },
    -- NvimTreeWindowPicker = { bg = colors.cyan_normal },
    -- debugPC = { link = "DiffAdd" },
    -- debugBreakpoint = { link = "KoreRedSign" },

    -- startify (startup screen)
    --StartifyBracket = { link = "KoreFg3" },
    --StartifyFile = { link = "KoreForeground" },
    --StartifyNumber = { link = "KoreBlue" },
    --StartifyPath = { link = "KoreGray" },
    --StartifySlash = { link = "KoreGray" },
    --StartifySection = { link = "KoreYellow" },
    --StartifySpecial = { link = "KoreComment" },
    --StartifyHeader = { link = "KoreOrange" },
    --StartifyFooter = { link = "KoreComment" },
    --StartifyVar = { link = "StartifyPath" },
    --StartifySelect = { link = "Title" },

    -- dirvish
    -- DirvishPathTail = { link = "KoreCyan" },
    -- DirvishArg = { link = "KoreYellow" },

    -- netrw
    -- netrwDir = { link = "KoreCyan" },
    -- netrwClassify = { link = "KoreCyan" },
    -- netrwLink = { link = "KoreGray" },
    -- netrwSymLink = { link = "KoreForeground" },
    -- netrwExe = { link = "KoreYellow" },
    -- netrwComment = { link = "KoreGray" },
    -- netrwList = { link = "KoreBlue" },
    -- netrwHelpCmd = { link = "KoreCyan" },
    -- netrwCmdSep = { link = "KoreFg3" },
    -- netrwVersion = { link = "KoreGreen" },
		
    -- NERDTree
    -- NERDTreeDir = { link = "KoreCyan" },
    -- NERDTreeDirSlash = { link = "KoreCyan" },
    -- NERDTreeOpenable = { link = "KoreOrange" },
    -- NERDTreeClosable = { link = "KoreOrange" },
    -- NERDTreeFile = { link = "KoreForeground" },
    -- NERDTreeExecFile = { link = "KoreYellow" },
    -- NERDTreeUp = { link = "KoreGray" },
    -- NERDTreeCWD = { link = "KoreGreen" },
    -- NERDTreeHelp = { link = "KoreForeground" },
    -- NERDTreeToggleOn = { link = "KoreGreen" },
    -- NERDTreeToggleOff = { link = "KoreRed" },

    -- coc (for code completion)
    -- CocErrorSign = { link = "KoreRedSign" },
    -- CocWarningSign = { link = "KoreOrangeSign" },
    -- CocInfoSign = { link = "KoreBlueSign" },
    -- CocHintSign = { link = "KoreCyanSign" },
    -- CocErrorFloat = { link = "KoreRed" },
    -- CocWarningFloat = { link = "KoreOrange" },
    -- CocInfoFloat = { link = "KoreBlue" },
    -- CocHintFloat = { link = "KoreCyan" },
    -- CocDiagnosticsError = { link = "KoreRed" },
    -- CocDiagnosticsWarning = { link = "KoreOrange" },
    -- CocDiagnosticsInfo = { link = "KoreBlue" },
    -- CocDiagnosticsHint = { link = "KoreCyan" },
    -- CocSelectedText = { link = "KoreRed" },
    -- CocMenuSel = { link = "PmenuSel" },
    -- CocCodeLens = { link = "KoreGray" },
    -- CocErrorHighlight = { link = "KoreRedUnderline" },
    -- CocWarningHighlight = { link = "KoreOrangeUnderline" },
    -- CocInfoHighlight = { link = "KoreBlueUnderline" },
    -- CocHintHighlight = { link = "KoreCyanUnderline" },

    -- navicicons
    -- NavicIconsFile = { link = "KoreBlue" },
    -- NavicIconsModule = { link = "KoreOrange" },
    -- NavicIconsNamespace = { link = "KoreBlue" },
    -- NavicIconsPackage = { link = "KoreCyan" },
    -- NavicIconsClass = { link = "KoreYellow" },
    -- NavicIconsMethod = { link = "KoreBlue" },
    -- NavicIconsProperty = { link = "KoreCyan" },
    -- NavicIconsField = { link = "KorePink" },
    -- NavicIconsConstructor = { link = "KoreBlue" },
    -- NavicIconsEnum = { link = "KorePink" },
    -- NavicIconsInterface = { link = "KoreGreen" },
    -- NavicIconsFunction = { link = "KoreBlue" },
    -- NavicIconsVariable = { link = "KorePink" },
    -- NavicIconsConstant = { link = "KoreOrange" },
    -- NavicIconsString = { link = "KoreGreen" },
    -- NavicIconsNumber = { link = "KoreOrange" },
    -- NavicIconsBoolean = { link = "KoreOrange" },
    -- NavicIconsArray = { link = "KoreOrange" },
    -- NavicIconsObject = { link = "KoreOrange" },
    -- NavicIconsKey = { link = "KoreCyan" },
    -- NavicIconsNull = { link = "KoreOrange" },
    -- NavicIconsEnumMember = { link = "KoreYellow" },
    -- NavicIconsStruct = { link = "KorePink" },
    -- NavicIconsEvent = { link = "KoreYellow" },
    -- NavicIconsOperator = { link = "KoreRed" },
    -- NavicIconsTypeParameter = { link = "KoreRed" },
    -- NavicText = { link = "KoreWhite" },
    -- NavicSeparator = { link = "KoreWhite" },

    -- html
    -- htmlTag = { link = "KoreCyanBold" },
    -- htmlEndTag = { link = "KoreCyanBold" },
    -- htmlTagName = { link = "KoreBlue" },
    -- htmlArg = { link = "KoreOrange" },
    -- htmlTagN = { link = "KoreForeground" },
    -- htmlSpecialTagName = { link = "KoreBlue" },
    -- htmlLink = { fg = colors.fg4, underline = config.underline },
    -- htmlSpecialChar = { link = "KoreRed" },
    -- htmlBold = { fg = colors.gray, bg = colors.background, bold = config.bold },
    -- htmlBoldUnderline = { fg = colors.gray, bg = colors.background, bold = config.bold, underline = config.underline },
    -- htmlBoldItalic = { fg = colors.gray, bg = colors.background, bold = config.bold, italic = true },
    -- htmlBoldUnderlineItalic = {
    --   fg = colors.gray,
    --   bg = colors.background,
    --   bold = config.bold,
    --   italic = true,
    --   underline = config.underline,
    -- },
    -- htmlUnderline = { fg = colors.gray, bg = colors.background, underline = config.underline },
    -- htmlUnderlineItalic = {
    --   fg = colors.gray,
    --   bg = colors.background,
    --   italic = true,
    --   underline = config.underline,
    -- },
    -- htmlItalic = { fg = colors.gray, bg = colors.background, italic = true },

    -- xml
    -- xmlTag = { link = "KoreCyanBold" },
    -- xmlEndTag = { link = "KoreCyanBold" },
    -- xmlTagName = { link = "KoreBlue" },
    -- xmlEqual = { link = "KoreBlue" },
    -- docbkKeyword = { link = "KoreCyanBold" },
    -- xmlDocTypeDecl = { link = "KoreGray" },
    -- xmlDocTypeKeyword = { link = "KorePink" },
    -- xmlCdataStart = { link = "KoreGray" },
    -- xmlCdataCdata = { link = "KorePink" },
    -- dtdFunction = { link = "KoreGray" },
    -- dtdTagName = { link = "KorePink" },
    -- xmlAttrib = { link = "KoreOrange" },
    -- xmlProcessingDelim = { link = "KoreGray" },
    -- dtdParamEntityPunct = { link = "KoreGray" },
    -- dtdParamEntityDPunct = { link = "KoreGray" },
    -- xmlAttribPunct = { link = "KoreGray" },
    -- xmlEntity = { link = "KoreRed" },
    -- xmlEntityPunct = { link = "KoreRed" },

    -- clojure
    -- clojureKeyword = { link = "KoreBlue" },
    -- clojureCond = { link = "KoreOrange" },
    -- clojureSpecial = { link = "KoreOrange" },
    -- clojureDefine = { link = "KoreOrange" },
    -- clojureFunc = { link = "KoreYellow" },
    -- clojureRepeat = { link = "KoreYellow" },
    -- clojureCharacter = { link = "KoreCyan" },
    -- clojureStringEscape = { link = "KoreCyan" },
    -- clojureException = { link = "KoreRed" },
    -- clojureRegexp = { link = "KoreCyan" },
    -- clojureRegexpEscape = { link = "KoreCyan" },
    -- clojureRegexpCharClass = { fg = colors.foreground, bold = config.bold },
    -- clojureRegexpMod = { link = "clojureRegexpCharClass" },
    -- clojureRegexpQuantifier = { link = "clojureRegexpCharClass" },
    -- clojureParen = { link = "KoreFg3" },
    -- clojureAnonArg = { link = "KoreYellow" },
    -- clojureVariable = { link = "KoreBlue" },
    -- clojureMacro = { link = "KoreOrange" },
    -- clojureMeta = { link = "KoreYellow" },
    -- clojureDeref = { link = "KoreYellow" },
    -- clojureQuote = { link = "KoreYellow" },
    -- clojureUnquote = { link = "KoreYellow" },
    
    -- c
    -- cOperator = { link = "KorePink" },
    -- cStructure = { link = "KoreOrange" },
    
    -- c++
    -- cppOperator = { link = "KorePink" },

    -- python
    -- pythonBuiltin = { link = "KoreOrange" },
    -- pythonBuiltinObj = { link = "KoreOrange" },
    -- pythonBuiltinFunc = { link = "KoreOrange" },
    -- pythonFunction = { link = "KoreCyan" },
    -- pythonDecorator = { link = "KoreRed" },
    -- pythonInclude = { link = "KoreBlue" },
    -- pythonImport = { link = "KoreBlue" },
    -- pythonRun = { link = "KoreBlue" },
    -- pythonCoding = { link = "KoreBlue" },
    -- pythonOperator = { link = "KoreRed" },
    -- pythonException = { link = "KoreRed" },
    -- pythonExceptions = { link = "KorePink" },
    -- pythonBoolean = { link = "KorePink" },
    -- pythonDot = { link = "KoreFg3" },
    -- pythonConditional = { link = "KoreRed" },
    -- pythonRepeat = { link = "KoreRed" },
    -- pythonDottedName = { link = "KoreGreenBold" },

    -- css
    -- cssBraces = { link = "KoreBlue" },
    -- cssFunctionName = { link = "KoreYellow" },
    -- cssIdentifier = { link = "KoreOrange" },
    -- cssClassName = { link = "KoreGreen" },
    -- cssColor = { link = "KoreBlue" },
    -- cssSelectorOp = { link = "KoreBlue" },
    -- cssSelectorOp2 = { link = "KoreBlue" },
    -- cssImportant = { link = "KoreGreen" },
    -- cssVendor = { link = "KoreForeground" },
    -- cssTextProp = { link = "KoreCyan" },
    -- cssAnimationProp = { link = "KoreCyan" },
    -- cssUIProp = { link = "KoreYellow" },
    -- cssTransformProp = { link = "KoreCyan" },
    -- cssTransitionProp = { link = "KoreCyan" },
    -- cssPrintProp = { link = "KoreCyan" },
    -- cssPositioningProp = { link = "KoreYellow" },
    -- cssBoxProp = { link = "KoreCyan" },
    -- cssFontDescriptorProp = { link = "KoreCyan" },
    -- cssFlexibleBoxProp = { link = "KoreCyan" },
    -- cssBorderOutlineProp = { link = "KoreCyan" },
    -- cssBackgroundProp = { link = "KoreCyan" },
    -- cssMarginProp = { link = "KoreCyan" },
    -- cssListProp = { link = "KoreCyan" },
    -- cssTableProp = { link = "KoreCyan" },
    -- cssFontProp = { link = "KoreCyan" },
    -- cssPaddingProp = { link = "KoreCyan" },
    -- cssDimensionProp = { link = "KoreCyan" },
    -- cssRenderProp = { link = "KoreCyan" },
    -- cssColorProp = { link = "KoreCyan" },
    -- cssGeneratedContentProp = { link = "KoreCyan" },

    -- purescript
    -- purescriptModuleKeyword = { link = "KoreCyan" },
    -- purescriptModuleName = { link = "KoreForeground" },
    -- purescriptWhere = { link = "KoreCyan" },
    -- purescriptDelimiter = { link = "KoreFg4" },
    -- purescriptType = { link = "KoreForeground" },
    -- purescriptImportKeyword = { link = "KoreCyan" },
    -- purescriptHidingKeyword = { link = "KoreCyan" },
    -- purescriptAsKeyword = { link = "KoreCyan" },
    -- purescriptStructure = { link = "KoreCyan" },
    -- purescriptOperator = { link = "KoreBlue" },
    -- purescriptTypeVar = { link = "KoreForeground" },
    -- purescriptConstructor = { link = "KoreForeground" },
    -- purescriptFunction = { link = "KoreForeground" },
    -- purescriptConditional = { link = "KoreOrange" },
    -- purescriptBacktick = { link = "KoreOrange" },

    -- coffeescript
    -- coffeeExtendedOp = { link = "KoreFg3" },
    -- coffeeSpecialOp = { link = "KoreFg3" },
    -- coffeeCurly = { link = "KoreOrange" },
    -- coffeeParen = { link = "KoreFg3" },
    -- coffeeBracket = { link = "KoreOrange" },

    -- ruby
    -- rubyStringDelimiter = { link = "KoreGreen" },
    -- rubyInterpolationDelimiter = { link = "KoreCyan" },
    -- rubyDefinedOperator = { link = "rubyKeyword" },
    -- objcTypeModifier = { link = "KoreRed" },
    -- objcDirective = { link = "KoreBlue" },

    -- go
    -- goDirective = { link = "KoreCyan" },
    -- goConstants = { link = "KorePink" },
    -- goDeclaration = { link = "KoreRed" },
    -- goDeclType = { link = "KoreBlue" },
    -- goBuiltins = { link = "KoreOrange" },

    -- lua
    luaIn = { link = "KoreRed" },
    luaFunction = { link = "KoreCyan" },
    luaTable = { link = "KoreOrange" },

    -- moonscript
    moonSpecialOp = { link = "KoreFg3" },
    moonExtendedOp = { link = "KoreFg3" },
    moonFunction = { link = "KoreFg3" },
    moonObject = { link = "KoreYellow" },

    -- java
    -- javaAnnotation = { link = "KoreBlue" },
    -- javaDocTags = { link = "KoreCyan" },
    -- javaCommentTitle = { link = "vimCommentTitle" },
    -- javaParen = { link = "KoreFg3" },
    -- javaParen1 = { link = "KoreFg3" },
    -- javaParen2 = { link = "KoreFg3" },
    -- javaParen3 = { link = "KoreFg3" },
    -- javaParen4 = { link = "KoreFg3" },
    -- javaParen5 = { link = "KoreFg3" },
    -- javaOperator = { link = "KoreOrange" },
    -- javaVarArg = { link = "KoreGreen" },

    -- elixir
    -- elixirDocString = { link = "Comment" },
    -- elixirStringDelimiter = { link = "KoreGreen" },
    -- elixirInterpolationDelimiter = { link = "KoreCyan" },
    -- elixirModuleDeclaration = { link = "KoreYellow" },

    -- scala
    -- scalaNameDefinition = { link = "KoreForeground" },
    -- scalaCaseFollowing = { link = "KoreForeground" },
    -- scalaCapitalWord = { link = "KoreForeground" },
    -- scalaTypeExtension = { link = "KoreForeground" },
    -- scalaKeyword = { link = "KoreRed" },
    -- scalaKeywordModifier = { link = "KoreRed" },
    -- scalaSpecial = { link = "KoreCyan" },
    -- scalaOperator = { link = "KoreForeground" },
    -- scalaTypeDeclaration = { link = "KoreYellow" },
    -- scalaTypeTypePostDeclaration = { link = "KoreYellow" },
    -- scalaInstanceDeclaration = { link = "KoreForeground" },
    -- scalaInterpolation = { link = "KoreCyan" },

    -- markdown
    -- markdownItalic = { fg = colors.foreground, italic = true },
    -- markdownBold = { fg = colors.foreground, bold = config.bold },
    -- markdownBoldItalic = { fg = colors.foreground, bold = config.bold, italic = true },
    -- markdownH1 = { link = "KoreGreenBold" },
    -- markdownH2 = { link = "KoreGreenBold" },
    -- markdownH3 = { link = "KoreYellowBold" },
    -- markdownH4 = { link = "KoreYellowBold" },
    -- markdownH5 = { link = "KoreYellow" },
    -- markdownH6 = { link = "KoreYellow" },
    -- markdownCode = { link = "KoreCyan" },
    -- markdownCodeBlock = { link = "KoreCyan" },
    -- markdownCodeDelimiter = { link = "KoreCyan" },
    -- markdownBlockquote = { link = "KoreGray" },
    -- markdownListMarker = { link = "KoreGray" },
    -- markdownOrdered_normalListMarker = { link = "KoreGray" },
    -- markdownRule = { link = "KoreGray" },
    -- markdownHeadingRule = { link = "KoreGray" },
    -- markdownUrlDelimiter = { link = "KoreFg3" },
    -- markdownLinkDelimiter = { link = "KoreFg3" },
    -- markdownLinkTextDelimiter = { link = "KoreFg3" },
    -- markdownHeadingDelimiter = { link = "KoreOrange" },
    -- markdownUrl = { link = "KorePink" },
    -- markdownUrlTitleDelimiter = { link = "KoreGreen" },
    -- markdownLinkText = { fg = colors.gray, underline = config.underline },
    -- markdownIdDeclaration = { link = "markdownLinkText" },

    -- haskell
    -- haskellType = { link = "KoreBlue" },
    -- haskellIdentifier = { link = "KoreCyan" },
    -- haskellSeparator = { link = "KoreFg4" },
    -- haskellDelimiter = { link = "KoreOrange" },
    -- haskellOperators = { link = "KorePink" },
    -- haskellBacktick = { link = "KoreOrange" },
    -- haskellStatement = { link = "KorePink" },
    -- haskellConditional = { link = "KorePink" },
    -- haskellLet = { link = "KoreRed" },
    -- haskellDefault = { link = "KoreRed" },
    -- haskellWhere = { link = "KoreRed" },
    -- haskellBottom = { link = "KoreRedBold" },
    -- haskellImportKeywords = { link = "KorePinkBold" },
    -- haskellDeclKeyword = { link = "KoreOrange" },
    -- haskellDecl = { link = "KoreOrange" },
    -- haskellDeriving = { link = "KorePink" },
    -- haskellAssocType = { link = "KoreCyan" },
    -- haskellNumber = { link = "KoreCyan" },
    -- haskellPragma = { link = "KoreRedBold" },
    -- haskellTH = { link = "KoreCyanBold" },
    -- haskellForeignKeywords = { link = "KoreGreen" },
    -- haskellKeyword = { link = "KoreRed" },
    -- haskellFloat = { link = "KoreCyan" },
    -- haskellInfix = { link = "KorePink" },
    -- haskellQuote = { link = "KoreGreenBold" },
    -- haskellShebang = { link = "KoreYellowBold" },
    -- haskellLiquid = { link = "KorePinkBold" },
    -- haskellQuasiQuoted = { link = "KoreBlueBold" },
    -- haskellRecursiveDo = { link = "KorePink" },
    -- haskellQuotedType = { link = "KoreRed" },
    -- haskellPreProc = { link = "KoreFg4" },
    -- haskellTypeRoles = { link = "KoreRedBold" },
    -- haskellTypeForall = { link = "KoreRed" },
    -- haskellPatternKeyword = { link = "KoreBlue" },

    -- mail    
    -- mailQuoted1 = { link = "KoreCyan" },
    -- mailQuoted2 = { link = "KorePink" },
    -- mailQuoted3 = { link = "KoreYellow" },
    -- mailQuoted4 = { link = "KoreGreen" },
    -- mailQuoted5 = { link = "KoreRed" },
    -- mailQuoted6 = { link = "KoreOrange" },
    -- mailSignature = { link = "Comment" },

    -- c#
    -- csBraces = { link = "KoreForeground" },
    -- csEndColon = { link = "KoreForeground" },
    -- csLogicSymbols = { link = "KoreForeground" },
    -- csParens = { link = "KoreFg3" },
    -- csOpSymbols = { link = "KoreFg3" },
    -- csInterpolationDelimiter = { link = "KoreFg3" },
    -- csInterpolationAlignDel = { link = "KoreCyanBold" },
    -- csInterpolationFormat = { link = "KoreCyan" },
    -- csInterpolationFormatDel = { link = "KoreCyanBold" },

    -- rust
    -- rustSigil = { link = "KoreOrange" },
    -- rustEscape = { link = "KoreCyan" },
    -- rustStringContinuation = { link = "KoreCyan" },
    -- rustEnum = { link = "KoreCyan" },
    -- rustStructure = { link = "KoreCyan" },
    -- rustModPathSep = { link = "KoreFg2" },
    -- rustCommentLineDoc = { link = "Comment" },
    -- rustDefault = { link = "KoreCyan" },

    -- ocaml
    -- ocamlOperator = { link = "KoreForeground" },
    -- ocamlKeyChar = { link = "KoreOrange" },
    -- ocamlArrow = { link = "KoreOrange" },
    -- ocamlInfixOpKeyword = { link = "KoreRed" },
    -- ocamlConstructor = { link = "KoreOrange" },

    -- lspsaga (plugin for improved lsp experience)
    -- LspSagaCodeActionTitle = { link = "Title" },
    -- LspSagaCodeActionBorder = { link = "KoreForeground" },
    -- LspSagaCodeActionContent = { fg = colors.green_normal, bold = config.bold },
    -- LspSagaLspFinderBorder = { link = "KoreForeground" },
    -- LspSagaAutoPreview = { link = "KoreOrange" },
    -- TargetWord = { fg = colors.blue_normal, bold = config.bold },
    -- FinderSeparator = { link = "KoreCyan" },
    -- LspSagaDefPreviewBorder = { link = "KoreBlue" },
    -- LspSagaHoverBorder = { link = "KoreOrange" },
    -- LspSagaRenameBorder = { link = "KoreBlue" },
    -- LspSagaDiagnosticSource = { link = "KoreOrange" },
    -- LspSagaDiagnosticBorder = { link = "KorePink" },
    -- LspSagaDiagnosticHeader = { link = "KoreGreen" },
    -- LspSagaSignatureHelpBorder = { link = "KoreGreen" },
    -- SagaShadow = { link = "KoreBackground" },

    -- dashboard (startup screen)
    -- DashboardShortCut = { link = "KoreOrange" },
    -- DashboardHeader = { link = "KoreCyan" },
    -- DashboardCenter = { link = "KoreYellow" },
    -- DashboardFooter = { fg = colors.pink_normal, italic = true },

    -- lspinlayhints
    -- LspInlayHint = { link = "comment" },
    
    -- carbon (directory tree view)
    -- CarbonFile = { link = "KoreForeground" },
    -- CarbonExe = { link = "KoreYellow" },
    -- CarbonSymlink = { link = "KoreCyan" },
    -- CarbonBrokenSymlink = { link = "KoreRed" },
    -- CarbonIndicator = { link = "KoreGray" },
    -- CarbonDanger = { link = "KoreRed" },
    -- CarbonPending = { link = "KoreYellow" },

    -- noice
    -- NoiceCursor = { link = "TermCursor" },

    -- notify (notificaiton alerts)
    -- NotifyDEBUGBorder = { link = "KoreBlue" },
    -- NotifyDEBUGIcon = { link = "KoreBlue" },
    -- NotifyDEBUGTitle = { link = "KoreBlue" },
    -- NotifyERRORBorder = { link = "KoreRed" },
    -- NotifyERRORIcon = { link = "KoreRed" },
    -- NotifyERRORTitle = { link = "KoreRed" },
    -- NotifyINFOBorder = { link = "KoreCyan" },
    -- NotifyINFOIcon = { link = "KoreCyan" },
    -- NotifyINFOTitle = { link = "KoreCyan" },
    -- NotifyTRACEBorder = { link = "KoreGreen" },
    -- NotifyTRACEIcon = { link = "KoreGreen" },
    -- NotifyTRACETitle = { link = "KoreGreen" },
    -- NotifyWARNBorder = { link = "KoreYellow" },
    -- NotifyWARNIcon = { link = "KoreYellow" },
    -- NotifyWARNTitle = { link = "KoreYellow" },

    -- illuminated
    -- IlluminatedWordText = { link = "LspReferenceText" },
    -- IlluminatedWordRead = { link = "LspReferenceRead" },
    -- IlluminatedWordWrite = { link = "LspReferenceWrite" },
    
    -- ts (not typescript)
    -- TSRainbowRed = { fg = colors.red_normal },
    -- TSRainbowOrange = { fg = colors.orange_normal },
    -- TSRainbowYellow = { fg = colors.yellow_normal },
    -- TSRainbowGreen = { fg = colors.green_normal },
    -- TSRainbowBlue = { fg = colors.blue_normal },
    -- TSRainbowViolet = { fg = colors.pink_normal },
    -- TSRainbowCyan = { fg = colors.cyan_normal },

    -- rainbow
    -- RainbowDelimiterRed = { fg = colors.red_normal },
    -- RainbowDelimiterOrange = { fg = colors.orange_normal },
    -- RainbowDelimiterYellow = { fg = colors.yellow_normal },
    -- RainbowDelimiterGreen = { fg = colors.green_normal },
    -- RainbowDelimiterBlue = { fg = colors.blue_normal },
    -- RainbowDelimiterViolet = { fg = colors.pink_normal },
    -- RainbowDelimiterCyan = { fg = colors.cyan_normal },

    -- dap (debug plugin)
    -- DapBreakpointSymbol = { fg = colors.red_normal, bg = colors.dark_normal },
    -- DapStoppedSymbol = { fg = colors.green_normal, bg = colors.dark_normal },
    -- DapUIBreakpointsCurrentLine = { link = "KoreYellow" },
    -- DapUIBreakpointsDisabledLine = { link = "KoreGray" },
    -- DapUIBreakpointsInfo = { link = "KoreCyan" },
    -- DapUIBreakpointsLine = { link = "KoreYellow" },
    -- DapUIBreakpointsPath = { link = "KoreBlue" },
    -- DapUICurrentFrameName = { link = "KorePink" },
    -- DapUIDecoration = { link = "KorePink" },
    -- DapUIEndofBuffer = { link = "EndOfBuffer" },
    -- DapUIFloatBorder = { link = "KoreCyan" },
    -- DapUILineNumber = { link = "KoreYellow" },
    -- DapUIModifiedValue = { link = "KoreRed" },
    -- DapUIPlayPause = { fg = colors.green_normal, bg = colors.dark_normal },
    -- DapUIRestart = { fg = colors.green_normal, bg = colors.dark_normal },
    -- DapUIScope = { link = "KoreBlue" },
    -- DapUISource = { link = "KoreForeground" },
    -- DapUIStepBack = { fg = colors.blue_normal, bg = colors.dark_normal },
    -- DapUIStepInto = { fg = colors.blue_normal, bg = colors.dark_normal },
    -- DapUIStepOut = { fg = colors.blue_normal, bg = colors.dark_normal },
    -- DapUIStepOver = { fg = colors.blue_normal, bg = colors.dark_normal },
    -- DapUIStop = { fg = colors.red_normal, bg = colors.dark_normal },
    -- DapUIStoppedThread = { link = "KoreBlue" },
    -- DapUIThread = { link = "KoreBlue" },
    -- DapUIType = { link = "KoreOrange" },
    -- DapUIUnavailable = { link = "KoreGray" },
    -- DapUIWatchesEmpty = { link = "KoreGray" },
    -- DapUIWatchesError = { link = "KoreRed" },
    -- DapUIWatchesValue = { link = "KoreYellow" },
    -- DapUIWinSelect = { link = "KoreYellow" },

    -- neogit (git vcs plugin)
    -- NeogitDiffDelete = { link = "DiffDelete" },
    -- NeogitDiffAdd = { link = "DiffAdd" },
    -- NeogitHunkHeader = { link = "WinBar" },
    -- NeogitHunkHeaderHighlight = { link = "WinBarNC" },

    -- diffview (diff viewer plugin) 
    -- DiffviewStatusModified = { link = "KoreGreenBold" },
    -- DiffviewFilePanelInsertions = { link = "KoreGreenBold" },
    -- DiffviewFilePanelDeletions = { link = "KoreRedBold" },

    -- mini
    -- MiniAnimateCursor = { reverse = true, nocombine = true },
    -- MiniAnimateNormalFloat = { fg = colors.foreground, bg = colors.dark_normal },
    -- MiniClueBorder = { link = "FloatBorder" },
    -- MiniClueDescGroup = { link = "DiagnosticFloatingWarn" },
    -- MiniClueDescSingle = { link = "NormalFloat" },
    -- MiniClueNextKey = { link = "DiagnosticFloatingHint" },
    -- MiniClueNextKeyWithPostkeys = { link = "DiagnosticFloatingError" },
    -- MiniClueSeparator = { link = "DiagnosticFloatingInfo" },
    -- MiniClueTitle = { link = "FloatTitle" },
    -- MiniCompletionActiveParameter = { underline = true },
    -- MiniCursorword = { underline = true },
    -- MiniCursorwordCurrent = { underline = true },
    -- MiniDepsChangeAdded = { link = "KoreGreen" },
    -- MiniDepsChangeRemoved = { link = "KoreRed" },
    -- MiniDepsHint = { link = "DiagnosticHint" },
    -- MiniDepsInfo = { link = "DiagnosticInfo" },
    -- MiniDepsMsgBreaking = { link = "DiagnosticWarn" },
    -- MiniDepsPlaceholder = { link = "Comment" },
    -- MiniDepsTitle = { link = "Title" },
    -- MiniDepsTitleError = { link = "DiffDelete" },
    -- MiniDepsTitleSame = { link = "DiffChange" },
    -- MiniDepsTitleUpdate = { link = "DiffAdd" },
    -- MiniDiffOverAdd = { link = "DiffAdd" },
    -- MiniDiffOverChange = { link = "DiffText" },
    -- MiniDiffOverContext = { link = "DiffChange" },
    -- MiniDiffOverDelete = { link = "DiffDelete" },
    -- MiniDiffSignAdd = { link = "KoreGreen" },
    -- MiniDiffSignChange = { link = "KoreCyan" },
    -- MiniDiffSignDelete = { link = "KoreRed" },
    -- MiniFilesBorder = { link = "FloatBorder" },
    -- MiniFilesBorderModified = { link = "DiagnosticFloatingWarn" },
    -- MiniFilesCursorLine = { bg = colors.dark_light },
    -- MiniFilesDirectory = { link = "Directory" },
    -- MiniFilesFile = { link = "KoreForeground" },
    -- MiniFilesNormal = { link = "NormalFloat" },
    -- MiniFilesTitle = { link = "FloatTitle" },
    -- MiniFilesTitleFocused = { link = "KoreOrangeBold" },
    -- MiniHipatternsFixme = { fg = colors.background, bg = colors.red_normal, bold = config.bold },
    -- MiniHipatternsHack = { fg = colors.background, bg = colors.yellow_normal, bold = config.bold },
    -- MiniHipatternsNote = { fg = colors.background, bg = colors.blue_normal, bold = config.bold },
    -- MiniHipatternsTodo = { fg = colors.background, bg = colors.cyan_normal_normal, bold = config.bold },
    -- MiniIconsAzure = { link = "KoreBlue" },
    -- MiniIconsBlue = { link = "KoreBlue" },
    -- MiniIconsCyan = { link = "KoreCyan" },
    -- MiniIconsGreen = { link = "KoreGreen" },
    -- MiniIconsGrey = { link = "KoreFg0" },
    -- MiniIconsOrange = { link = "KoreOrange" },
    -- MiniIconsPurple = { link = "KorePink" },
    -- MiniIconsRed = { link = "KoreRed" },
    -- MiniIconsYellow = { link = "KoreYellow" },
    -- MiniIndentscopeSymbol = { link = "KoreGray" },
    -- MiniIndentscopeSymbolOff = { link = "KoreYellow" },
    -- MiniJump = { link = "KoreOrangeUnderline" },
    -- MiniJump2dDim = { link = "KoreGray" },
    -- MiniJump2dSpot = { fg = colors.orange_normal, bold = config.bold, nocombine = true },
    -- MiniJump2dSpotAhead = { fg = colors.cyan_normal, bg = colors.background, nocombine = true },
    -- MiniJump2dSpotUnique = { fg = colors.yellow_normal, bold = config.bold, nocombine = true },
    -- MiniMapNormal = { link = "NormalFloat" },
    -- MiniMapSymbolCount = { link = "Special" },
    -- MiniMapSymbolLine = { link = "Title" },
    -- MiniMapSymbolView = { link = "Delimiter" },
    -- MiniNotifyBorder = { link = "FloatBorder" },
    -- MiniNotifyNormal = { link = "NormalFloat" },
    -- MiniNotifyTitle = { link = "FloatTitle" },
    -- MiniOperatorsExchangeFrom = { link = "IncSearch" },
    -- MiniPickBorder = { link = "FloatBorder" }
    -- MiniPickBorderBusy = { link = "DiagnosticFloatingWarn" },
    -- MiniPickBorderText = { link = "FloatTitle" },
    -- MiniPickIconDirectory = { link = "Directory" },
    -- MiniPickIconFile = { link = "MiniPickNormal" },
    -- MiniPickHeader = { link = "DiagnosticFloatingHint" },
    -- MiniPickMatchCurrent = { bg = colors.dark_light },
    -- MiniPickMatchMarked = { link = "Visual" },
    -- MiniPickMatchRanges = { link = "DiagnosticFloatingHint" },
    -- MiniPickNormal = { link = "NormalFloat" },
    -- MiniPickPreviewLine = { link = "CursorLine" },
    -- MiniPickPreviewRegion = { link = "IncSearch" },
    -- MiniPickPrompt = { link = "DiagnosticFloatingInfo" },
    -- MiniStarterCurrent = { nocombine = true },
    -- MiniStarterFooter = { link = "KoreGray" },
    -- MiniStarterHeader = { link = "Title" },
    -- MiniStarterInactive = { link = "Comment" },
    -- MiniStarterItem = { link = "Normal" },
    -- MiniStarterItemBullet = { link = "Delimiter" },
    -- MiniStarterItemPrefix = { link = "WarningMsg" },
    -- MiniStarterSection = { link = "Delimiter" },
    -- MiniStarterQuery = { link = "MoreMsg" },
    -- MiniStatuslineDevinfo = { link = "StatusLine" },
    -- MiniStatuslineFileinfo = { link = "StatusLine" },
    -- MiniStatuslineFilename = { link = "StatusLineNC" },
    -- MiniStatuslineInactive = { link = "StatusLineNC" },
    -- MiniStatuslineModeCommand = { fg = colors.background, bg = colors.yellow_normal, bold = config.bold },
    -- MiniStatuslineModeInsert = { fg = colors.background, bg = colors.blue_normal, bold = config.bold },
    -- MiniStatuslineModeNormal = { fg = colors.background, bg = colors.foreground, bold = config.bold },
    -- MiniStatuslineModeOther = { fg = colors.background, bg = colors.cyan_normal, bold = config.bold },
    -- MiniStatuslineModeReplace = { fg = colors.background, bg = colors.red_normal, bold = config.bold },
    -- MiniStatuslineModeVisual = { fg = colors.background, bg = colors.green_normal, bold = config.bold },
    -- MiniSurround = { link = "IncSearch" },
    -- MiniTablineCurrent = { fg = colors.green_normal, bg = colors.dark_normal, bold = config.bold, reverse = config.invert_tabline },
    -- MiniTablineFill = { link = "TabLineFill" },
    -- MiniTablineHidden = { fg = colors.light_dark, bg = colors.dark_normal, reverse = config.invert_tabline },
    -- MiniTablineModifiedCurrent = {
    --   fg = colors.dark_normal,
    --   bg = colors.green_normal,
    --   bold = config.bold,
    --   reverse = config.invert_tabline,
    -- },
    -- MiniTablineModifiedHidden = { fg = colors.dark_normal, bg = colors.light_dark, reverse = config.invert_tabline },
    -- MiniTablineModifiedVisible = { fg = colors.dark_normal, bg = colors.foreground, reverse = config.invert_tabline },
    -- MiniTablineTabpagesection = { link = "Search" },
    -- MiniTablineVisible = { fg = colors.foreground, bg = colors.dark_normal, reverse = config.invert_tabline },
    -- MiniTestEmphasis = { bold = config.bold },
    -- MiniTestFail = { link = "KoreRedBold" },
    -- MiniTestPass = { link = "KoreGreenBold" },
    -- MiniTrailspace = { bg = colors.red_normal },

  }

  for group, hl in pairs(config.overrides) do
    if groups[group] then
      -- "link" should not mix with other configs (:h hi-link)
      groups[group].link = nil
    end

    groups[group] = vim.tbl_extend("force", groups[group] or {}, hl)
  end

  return groups
end

---@param config KoreConfig?
Kore.setup = function(config)
  Kore.config = vim.tbl_deep_extend("force", Kore.config, config or {})
end

--- main load function
Kore.load = function()
  if vim.version().minor < 8 then
    vim.notify_once("gruvbox.nvim: you must use neovim 0.8 or higher")
    return
  end

  -- reset colors
  if vim.g.colors_name then
    vim.cmd.hi("clear")
  end
  vim.g.colors_name = "gruvbox"
  vim.o.termguicolors = true

  local groups = get_groups()

  -- add highlights
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return Kore
