local config = function(_, opts)
	local dap_py = require("dap-python")

	local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"

	dap_py.setup(path)
end

return config
