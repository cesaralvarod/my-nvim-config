local config = function()
	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")
	local lspconfig = require("lspconfig")
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local neodev = require("neodev")

	local icons = require("cesaralvarod.config.icons")
	local servers = require("cesaralvarod.config.lsp.servers")
	local setups = require("cesaralvarod.config.lsp.setups")

	local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

	neodev.setup()

	capabilities.offsetEncoding = { "utf-16" }

	-- Setup mason

	mason.setup({
		ui = {
			border = "none",
			icons = {
				package_installed = icons.ui.Check,
				package_pending = icons.ui.BoldArrowRight,
				package_uninstalled = icons.ui.Close,
			},
		},
		ensure_installed = servers,
	})

	-- Setup servers

	mason_lspconfig.setup_handlers({
		function(server_name) -- default handler (optional)
			lspconfig[server_name].setup(setups[server_name]())
		end,
	})
end

return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		lazy = false,
		priority = 500,
		config = config,
	},
	{
		"neovim/nvim-lspconfig",
	},
}
