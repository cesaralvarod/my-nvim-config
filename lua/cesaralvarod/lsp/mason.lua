local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status_ok then
	return
end

local icons = require("cesaralvarod.icons")

local servers = require("cesaralvarod.lsp.servers")

local setups = require("cesaralvarod.lsp.setups")

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

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
