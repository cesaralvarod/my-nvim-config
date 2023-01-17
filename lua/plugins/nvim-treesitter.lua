local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

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
		"php",
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
		diable = {},
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		disable = {},
	},
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = false,
		extended_mode = true,
		max_file_lines = nil,
	},
})

require("template-string").setup({
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
	},
})
