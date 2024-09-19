local Config = {}

Config.theme = "orange"

--- setup initial configuration options
function Config.setup(opts)
    Config.options = vim.tbl_deep_extend("force", {}, Config, opts or {})
end

return Config
