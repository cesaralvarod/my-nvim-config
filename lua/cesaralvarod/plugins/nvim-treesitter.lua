local has_ts, configs = pcall(require, "nvim-treesitter.configs")
if not has_ts then
	return
end

local has_template_string, template_string = pcall(require, "template-string")
if not has_template_string then
	return
end

local parser_mapping = require("nvim-treesitter.parsers").filetype_to_parsername
parser_mapping.xml = "html" -- map the html parser to be used when using xml files

configs.setup({
	ensure_installed = {
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
		"php", -- vim-polyglot better
		"java",
		"kotlin",
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
	},
	highlight = {
		enable = true,
		use_languagetree = true,
		disable = { "php" },
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		disable = {},
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
		extended_mode = false,
		max_file_lines = nil,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})

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
