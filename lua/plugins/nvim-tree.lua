local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

local icons = require("icons")

local web_devicons_ok, web_devicons = pcall(require, "nvim-web-devicons")
if not web_devicons_ok then
	return
end

local material_icon_ok, material_icon = pcall(require, "nvim-material-icon")

material_icon.setup({
	-- your personnal icons can go here (to override)
	override = {
		zsh = {
			icon = "",
			color = "#428850",
			cterm_color = "65",
			name = "Zsh",
		},
		fish = {
			icon = "",
			color = "#428850",
			cterm_color = "65",
			name = "Fish",
		},
	},
	color_icons = true,
	default = true,
})

web_devicons.setup({
	override = material_icon.get_icons(),
})

local config = {

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
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
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
	-- tab = {
	-- 	sync = {
	-- 		open = false,
	-- 		close = false,
	-- 		ignore = {},
	-- 	},
	-- },
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
		mappings = {
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
				{ key = "s", cb = tree_cb("split") },
				{ key = "?", action = "toggle_help" },
				{ key = "d", action = "cd" }, -- remove
				{ key = "x", action = "remove" }, -- cut
				{ key = "t", action = "cut" },
				{ key = "u", action = "dir_up" },
				{ key = "'", action = "close_node" },
				{ key = '"', action = "collapse_all" },

				{ key = "<Space>p", action = "prev_diag_item" },
				{ key = "<Space>.", action = "next_diag_item" },
				{ key = "<Space>k", action = "prev_git_item" },
				{ key = "<Space>j", action = "next_git_item" },

				{ key = { "<2-RightMouse>", "<C-]>" }, action = "" }, -- cd
				{ key = "<C-v>", action = "" }, -- vsplit
				{ key = "<C-x>", action = "" }, -- split
				{ key = "<C-t>", action = "" }, -- tabnew
				{ key = "<BS>", action = "" }, -- close_node
				{ key = "<Tab>", action = "" }, -- preview
				{ key = "D", action = "" }, -- trash
				{ key = "[e", action = "" }, -- prev_diag_item
				{ key = "]e", action = "" }, -- next_diag_item
				{ key = "[c", action = "" }, -- prev_git_item
				{ key = "]c", action = "" }, -- next_git_item
				{ key = "-", action = "" }, -- dir_up
				{ key = "s", action = "" }, -- system_open
				{ key = "W", action = "" }, -- collapse_all
				{ key = "g?", action = "" }, -- toggle_help
			},
		},
	},
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup(config)
