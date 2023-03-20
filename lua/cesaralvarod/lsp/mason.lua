local has_mason, mason = pcall(require, "mason")
if not has_mason then
	return
end

local has_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if not has_mason_lspconfig then
	return
end

local has_lspconfig, lspconfig = pcall(require, "lspconfig")
if not has_lspconfig then
	return
end

local has_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not has_cmp_nvim_lsp then
	return
end

local has_neodev, neodev = pcall(require, "neodev")
if not has_neodev then
	return
end

local icons = require("cesaralvarod.icons")

local servers = require("cesaralvarod.lsp.servers")

local setups = require("cesaralvarod.lsp.setups")

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

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
