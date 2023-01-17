local mason = require("mason")

local servers = {
	"sumneko_lua",
	"blade-formatter",
	"dockerfile-language-server",
	"emmet-ls",
	"go-debug-adapter",
	"golangci-lint",
	"gopls",
	"json-lsp",
	"lua-language-server",
	"php-debug-adapter",
	"rust-analyzer",
	"stylua",
	"typescript-language-server",
	"vue-language-server",
	"phpactor",
	"sql-formatter",
	"pyright",
}

local icons = require("icons")

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
require("mason-lspconfig").setup_handlers({
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({})
	end,
})
