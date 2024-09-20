local Config = {}

-- configuration options
Config.theme = "orange"

--- setup initial configuration options (i.e. override defaults)
function Config.setup(opts)
    Config.options = vim.tbl_deep_extend("force", {}, Config, opts or {})
end

return Config
