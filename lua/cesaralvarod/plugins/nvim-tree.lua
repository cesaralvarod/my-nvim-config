local config = function()
	local tree = require("nvim-tree")

	local icons = require("cesaralvarod.config.icons")

	local opts = {
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
		},
	}

	-- setup
	tree.setup(opts)
end

return {
	"DaikyXendo/nvim-tree.lua",
	dependencies = {
		"DaikyXendo/nvim-material-icon",
		"nvim-tree/nvim-web-devicons",
	},

	config = config,
}
