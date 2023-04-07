local config = function()
	local telescope = require("telescope")

	local fb_actions = require("telescope").extensions.file_browser.actions

	local builtin = require("telescope.builtin")

	telescope.load_extension("buffer_lines")
	telescope.load_extension("media_files")
	telescope.load_extension("emoji")
	telescope.load_extension("vim_bookmarks")
	telescope.load_extension("file_browser")
	telescope.load_extension("fzf")
	telescope.load_extension("docker")

	local icons = require("cesaralvarod.config.icons")

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
			docker = {
				init_term = "tabnew",
				binary = "docker",
			},
		},
	})

	-- Keymaps

	vim.keymap.set("n", "<C-p>", function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") })
	end)
end

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"jeetsukumaran/telescope-buffer-lines.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		"xiyaowong/telescope-emoji.nvim",
		"tom-anders/telescope-vim-bookmarks.nvim",
		"nvim-telescope/telescope-file-browser.nvim", -- command file_browser
		-- "nvim-telescope/telescope-dap.nvim",
		-- "nvim-telescope/telescope-ui-select.nvim",
		"lpoto/telescope-docker.nvim", -- docker plugin
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = config,
	cmd = "Telescope",
	keys = {
		{
			"<leader>f",
			"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		},
		{
			"<leader>b",
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		},
		{ "<leader>sf", "<cmd>Telescope file_browser<cr>" },
		{ "<leader>F", "<cmd>Telescope live_grep<cr>" },
		{
			"<leader>G",
			"<cmd>Telescope current_buffer_fuzzy_find<cr>",
		},

		{ "<leader>sc", "<cmd>Telescope colorscheme<cr>" },
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>" },
		{ "<leader>sM", "<cmd>Telescope man_pages<cr>" },
		{ "<leader>so", "<cmd>Telescope oldfiles<cr>" },
		{ "<leader>sR", "<cmd>Telescope registers<cr>" },
		{ "<leader>sk", "<cmd>Telescope keymaps<cr>" },
		{ "<leader>sC", "<cmd>Telescope commands<cr>" },

		{ "<leader>sb", "<cmd>Telescope git_branches<cr>" },
		{ "<leader>sgc", "<cmd>Telescope git_commits<cr>" },
		{ "<leader>sgs", "<cmd>Telescope git_status<cr>" },

		{ "<leader>fd", "<cmd>Telescope docker containers<cr>" },
		{ "<leader>fi", "<cmd>Telescope docker images<cr>" },
		{ "<leader>fcc", "<cmd>Telescope docker compose<cr>" },
	},
}
