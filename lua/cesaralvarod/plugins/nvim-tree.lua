local on_attach = function(bufnr)
	local api = require("nvim-tree.api")
	-- local preview = require("nvim-tree-preview")

	local function opts(desc)
		return {
			desc = "nvim-tree: " .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		}
	end

	api.config.mappings.default_on_attach(bufnr)

	-- mappings
	vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
	vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
	vim.keymap.del("n", "<C-v>", { buffer = bufnr })
	vim.keymap.del("n", "<C-x>", { buffer = bufnr })
	vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
	vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open: Horizontal Split"))
	vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
	--[[ 	vim.keymap.set("n", "P", preview.watch, opts("Preview (Watch)"))
	vim.keymap.set("n", "<Esc>", preview.unwatch, opts("Close Preview/Unwatch"))
	vim.keymap.set("n", "<Tab>", function()
		local ok, node = pcall(api.tree.get_node_under_cursor)
		if ok and node then
			if node.type == "directory" then
				api.node.open.edit()
			else
				preview.node(node, { toggle_focus = true })
			end
		end
	end, opts("Preview"))  ]]
end

local config = function()
	local tree = require("nvim-tree")

	local icons = require("cesaralvarod.config.icons")

	local opts = {
		on_attach = on_attach,
		renderer = {
			group_empty = true,
			root_folder_modifier = ":t",
			full_name = true,
			indent_markers = {
				enable = true,
			},
			icons = {
				webdev_colors = true,
				padding = " ",
				symlink_arrow = " ➛ ",
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
				},
				glyphs = {
					default = icons.ui.FileWithText,
					symlink = icons.ui.FileSymlink,
					bookmark = icons.ui.BookMark,
					folder = {
						arrow_open = icons.ui.TriangleShortArrowDown,
						arrow_closed = icons.ui.TriangleShortArrowRight,
						default = icons.ui.Folder,
						open = icons.ui.FolderOpen,
						empty = icons.ui.FolderEmpty,
						empty_open = icons.ui.EmptyFolderOpen,
						symlink = icons.ui.FolderSymlink,
						symlink_open = icons.ui.FolderOpen,
					},
					git = {
						unstaged = icons.git.FileUnstaged,
						staged = icons.git.FileStaged,
						unmerged = icons.git.FileUnmerged,
						renamed = icons.git.FileRenamed,
						untracked = icons.git.FileUntracked,
						deleted = icons.git.FileDeleted,
						ignored = icons.git.FileIgnored,
					},
				},
			},
			special_files = { "Cargo.toml", "Makefile", "README.md" },
			symlink_destination = true,
		},
		hijack_directories = {
			enable = true,
			auto_open = true,
		},
		update_focused_file = {
			enable = true,
			-- debounce_delay = 15,
			update_root = true,
			ignore_list = { "help" },
		},
		diagnostics = {
			enable = true,
			show_on_dirs = false,
			-- show_on_open_dirs = true,
			debounce_delay = 50,
			icons = {
				hint = icons.diagnostics.BoldHint,
				info = icons.diagnostics.BoldInformation,
				warning = icons.diagnostics.BoldWarning,
				error = icons.diagnostics.BoldError,
			},
		},
		filters = {
			dotfiles = false,
			-- git_clean = false,
			-- no_buffer = false,
			custom = { "^node_modules$", "\\.cache", "^.git$" },
			exclude = {},
		},
		git = {
			enable = true,
			ignore = false,
			show_on_dirs = true,
			-- show_on_open_dirs = true,
			timeout = 200,
		},
		actions = {
			use_system_clipboard = true,
			change_dir = {
				enable = true,
				global = false,
				restrict_above_cwd = false,
			},
			expand_all = {
				max_folder_discovery = 300,
				exclude = {},
			},
			file_popup = {
				open_win_config = {
					col = 1,
					row = 1,
					relative = "cursor",
					border = "shadow",
					style = "minimal",
				},
			},
			open_file = {
				quit_on_open = true,
				resize_window = false,
				window_picker = {
					enable = true,
					-- picker = "default",
					chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
					exclude = {
						filetype = { "notify", "lazy", "qf", "diff", "fugitive", "fugitiveblame" },
						buftype = { "nofile", "terminal", "help" },
					},
				},
			},
			remove_file = {
				close_window = false,
			},
		},
		trash = {
			cmd = "trash",
			require_confirm = true,
		},
		live_filter = {
			prefix = "[" .. icons.ui.Search .. "]: ",
			always_show_folders = false,
		},
		log = {
			enable = false,
			truncate = false,
			types = {
				all = false,
				config = false,
				copy_paste = false,
				dev = false,
				diagnostics = false,
				git = false,
				profile = false,
				watcher = false,
			},
		},
		system_open = {
			cmd = nil,
			args = {},
		},
		view = {
			width = 35,
			side = "left",
			adaptive_size = false,
		},
	}

	-- setup
	tree.setup(opts)
end

local preview_config = function()
	local preview = require("nvim-tree-preview")

	preview.setup({
		keymaps = {
			["<Esc>"] = { action = "close", unwatch = true },
			["<Tab>"] = { action = "toggle_focus" },
			["<CR>"] = { open = "edit" },
			["<C-t>"] = { open = "tab" },
			["v"] = { open = "vertical" },
			["s"] = { open = "horizontal" },
		},
		min_width = 10,
		min_height = 5,
		max_width = 85,
		max_height = 25,
		wrap = false, -- Whether to wrap lines in the preview window
		border = "rounded", -- Border style for the preview window
	})
end

return {
	"DaikyXendo/nvim-tree.lua",
	dependencies = {
		"DaikyXendo/nvim-material-icon",
		"nvim-tree/nvim-web-devicons",
		--[[ 	{
			"b0o/nvim-tree-preview.lua",
			dependencies = "nvim-lua/plenary.nvim",
			config = preview_config,
		}, ]]
	},

	config = config,
}
