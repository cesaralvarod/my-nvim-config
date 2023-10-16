local config = function()
	local lualine = require("lualine")

	local icons = require("cesaralvarod.config.icons")

	local hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end

	local diagnostics = {
		"diagnostics",
		sources = { "nvim_diagnostic" },
		sections = { "error", "warn" },
		symbols = {
			error = icons.diagnostics.BoldError .. " ",
			warn = icons.diagnostics.BoldWarning .. " ",
		},
		colored = true,
		update_in_insert = false,
		always_visible = true,
	}

	local diff = {
		"diff",
		colored = true,
		symbols = {
			added = icons.git.LineAdded .. " ",
			modified = icons.git.LineModified .. " ",
			removed = icons.git.LineRemoved .. " ",
		}, -- changes diff symbols
		cond = hide_in_width,
	}

	local mode = {
		"mode",
		fmt = function(str)
			--return "-- " .. str .. " --"
			return str
		end,
	}

	local filetype = {
		"filetype",
		icons_enabled = true,
		icon = nil,
	}

	local branch = {
		"branch",
		icons_enabled = true,
		icon = icons.git.Branch,
	}

	local location = {
		"location",
		padding = 0,
	}

	-- cool function for progress
	local progress = function()
		local current_line = vim.fn.line(".")
		local total_lines = vim.fn.line("$")
		local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
		local line_ratio = current_line / total_lines
		local index = math.ceil(line_ratio * #chars)
		return chars[index]
	end

	-- options
	local opts = {
		options = {
			theme = "auto",
			icons_enabled = true,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = { mode },
			lualine_b = { branch, diagnostics },
			lualine_c = { "filename" },
			-- lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_x = { diff, "fileformat", "encoding", filetype },
			lualine_y = { progress },
			lualine_z = { location },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	}

	-- setup
	lualine.setup(opts)
end

return {
	"nvim-lualine/lualine.nvim",
	priority = 500,

	config = config,
}
