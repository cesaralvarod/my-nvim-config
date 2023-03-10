local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local fb_actions = require("telescope").extensions.file_browser.actions

local builtin = require("telescope.builtin")

telescope.load_extension("buffer_lines")
telescope.load_extension("media_files")
telescope.load_extension("emoji")
telescope.load_extension("vim_bookmarks")
telescope.load_extension("file_browser")
telescope.load_extension("fzf")

local icons = require("cesaralvarod.icons")

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = " " .. icons.ui.Telescope .. " ",
		selection_caret = icons.ui.Forward .. " ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = { "node_modules" },
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display = { "smart" },
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = false, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg", "svg" },
			find_cmd = "rg", -- find command (defaults to `fd`)
		},
		file_browser = {
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- remap to going to home directory
					["<C-h>"] = fb_actions.goto_home_dir,
				},
				["n"] = {},
			},
		},
	},
})

-- Keymaps

vim.keymap.set("n", "<C-p>", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- vim.keymap.set("n", "<C-p>", builtin.git_files, {})
