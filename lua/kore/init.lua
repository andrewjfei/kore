local Kore = {}

function Kore.load()
	require("kore.theme").setup()
end

--- setup initial configuration options
function Kore.setup(opts)
    require("kore.config").setup(opts)
end

return Kore
