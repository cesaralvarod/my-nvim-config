local config = function()
	local parsers = require("nvim-treesitter.parsers")
	local configs = require("nvim-treesitter.configs")
	local template_string = require("template-string")
	local comment_string = require("ts_context_commentstring")

	-- neovim < 0.9
	--[[ 	local parser_mapping = require("nvim-treesitter.parsers").filetype_to_parsername
	parser_mapping.astro = "tsx" --map the astro parser to be used when using tsx files
	parser_mapping.xml = "html" -- map the html parser to be used when using xml files ]]
	-- neovim > 0.9
	vim.treesitter.language.register("astro", "tsx")
	vim.treesitter.language.register("xml", "html")

	parsers.get_parser_configs().asm = {
		install_info = {
			url = "https://github.com/rush-rs/tree-sitter-asm.git",
			files = { "src/parser.c" },
			branch = "main",
		},
	}

	-- servers
	local ensure_installed = {
		"lua",
		"javascript",
		"typescript",
		"json",
		"css",
		"html",
		"vue",
		"svelte",
		"gitignore",
		"vim",
		"solidity",
		"graphql",
		"php",
		"java",
		"c",
		"cpp",
		"arduino",
		"rust",
		"ruby",
		"bash",
		"python",
		"tsx",
		"yaml",
		"markdown",
		"markdown_inline",
		"regex",
		"astro",
	}

	local setup = {
		ensure_installed = ensure_installed,
		highlight = {
			enable = true,
			use_languagetree = false,
			disable = { "http" },
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
			disable = { "http" },
		},
		autotag = {
			enable = true,
			filetypes = {
				"html",
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"svelte",
				"vue",
				"tsx",
				"jsx",
				"rescript",
				"xml",
				"php",
				"markdown",
				"glimmer",
				"handlebars",
				"hbs",
			},
			skip_tags = {
				"area",
				"base",
				"br",
				"col",
				"command",
				"embed",
				"hr",
				"img",
				"slot",
				"input",
				"keygen",
				"link",
				"meta",
				"param",
				"source",
				"track",
				"wbr",
				"menuitem",
			},
		},
		rainbow = {
			enable = false,
			disable = { "html", "css", "json", "lua", "jsonc" },
			max_file_lines = nil,
			extended_mode = false,
		},
		playground = {
			enable = true,
			disable = {},
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = false, -- Whether the query persists across vim sessions
			keybindings = {
				toggle_query_editor = "o",
				toggle_hl_groups = "i",
				toggle_injected_languages = "t",
				toggle_anonymous_nodes = "a",
				toggle_language_display = "I",
				focus_language = "f",
				unfocus_language = "F",
				update = "R",
				goto_node = "<cr>",
				show_help = "?",
			},
		},
	}

	-- setup
	configs.setup(setup)

	template_string.setup({
		filetypes = {
			"typescript",
			"javascript",
			"typescriptreact",
			"javascriptreact",
			"python",
		}, -- filetypes where the plugin is active
		jsx_brackets = true, -- must add brackets to jsx attributes
		remove_template_string = false, -- remove backticks when there are no template string
		restore_quotes = {
			-- quotes used when "remove_template_string" option is enabled
			normal = [[']],
			jsx = [["]],
			tsx = [["]],
		},
	})

	comment_string.setup({
		enable_autocmd = false,
	})
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"windwp/nvim-ts-autotag", -- tresitter auto close tags
			"p00f/nvim-ts-rainbow", -- treesiter rainbow pairs
			"JoosepAlviste/nvim-ts-context-commentstring", -- treesitter comments, work with Comment.nvim
			"axelvc/template-string.nvim", -- treesitter template string
			"rush-rs/tree-sitter-asm", -- assembler highlight
			-- "gbprod/php-enhanced-treesitter.nvim", -- sql embedded in files php
		},

		config = config,
	},

	{
		"nvim-treesitter/playground",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cmd = { "TSHighlightCapturesUnderCursor", "TSNodeUnderCursor" },
	},
}
