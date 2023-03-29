require("cesaralvarod.config.lazy")

local has_lazy, lazy = pcall(require, "lazy")

if not has_lazy then
	error("Install Lazy")
end

lazy.setup("cesaralvarod.plugins", {
	change_detection = {
		notify = false,
	},
})
