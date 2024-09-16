---@class kore.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias kore.Highlights table<string, kore.Highlight | string>

---@alias kore.HighlightsFn fun(colors: ColorScheme, opts: kore.Config): kore.Highlights

---@class kore.Cache
---@field groups kore.Highlights
---@field inputs table
