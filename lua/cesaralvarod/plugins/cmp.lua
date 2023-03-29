return {
	{
		"hrsh7th/nvim-cmp",

		dependencies = {

			"hrsh7th/cmp-nvim-lsp", -- Autocomplete lsp
			"hrsh7th/cmp-nvim-lua", -- Autocomplete lua global variables (vim)
			"hrsh7th/cmp-buffer", -- Autcomplete buffer
			"hrsh7th/cmp-emoji", -- Autocomplete emojis
			"hrsh7th/cmp-path", -- Autocomplete paths
			"hrsh7th/cmp-cmdline", -- Autocomplete cmdline
			"hrsh7th/cmp-nvim-lsp-signature-help", -- Autocomplete signatures
			"kdheepak/cmp-latex-symbols", -- Autocomplete symbols
			"saadparwaiz1/cmp_luasnip", -- Autocomplete snippets
			"petertriho/cmp-git", -- Autocomplete git
			{ "tzachar/cmp-tabnine", build = "./install.sh" },
		},
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
	},
	{

		"folke/neodev.nvim",
	},
}
