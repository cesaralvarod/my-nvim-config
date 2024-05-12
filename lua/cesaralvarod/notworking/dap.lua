local ensure_installed = {
	"codelldb",
	"debugpy",
	"js-debug-adapter",
}

local config_dapui = function()
	local dap = require("dap")
	local dapui = require("dapui")

	-- setup dap
	dapui.setup()

	-- listeners
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end

-- protocolo de adaptador de depuracion
--
return {
	{
		"rcarriga/nvim-dap-ui",
		-- event = "VeryLazy",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },

		config = config_dapui,
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
			ensure_installed = ensure_installed,
		},
	},

	{
		"mfussenegger/nvim-dap",

		config = function()
			local dap = require("dap")

			dap.adapters["pwa-node"] = {
				type = "server",
				host = "127.0.0.1",
				port = 8123,
				executable = {
					command = "js-debug-adapter",
				},
			}

			for _, lang in ipairs({ "typescript", "javascript" }) do
				dap.configurations[lang] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
						runtimeExecutable = "node",
					},
				}
			end
		end,
	},

	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = require("cesaralvarod.config.dap.dap_python"),
	},
}
