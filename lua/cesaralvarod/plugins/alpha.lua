local config = function()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")

	local dashboard = require("alpha.themes.dashboard")
	dashboard.section.header.val = {
		[[  =========================================================  ]],
		[[ ||  ______                __                             || ]],
		[[ || /\  _  \              /\ \                            || ]],
		[[ || \ \ \L\ \     ___     \_\ \    _ __     __     ___    || ]],
		[[ ||  \ \  __ \  /' _ `\   /'_` \  /\`'__\ /'__`\  / __`\  || ]],
		[[ ||   \ \ \/\ \ /\ \/\ \ /\ \L\ \ \ \ \/ /\  __/ /\ \L\ \ || ]],
		[[ ||    \ \_\ \_\\ \_\ \_\\ \___,_\ \ \_\ \ \____\\ \____/ || ]],
		[[ ||     \/_/\/_/ \/_/\/_/ \/__,_ /  \/_/  \/____/ \/___/  || ]],
		[[  =========================================================  ]],
	}
	dashboard.section.buttons.val = {
		dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
		dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
		dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
		dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
		dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
	}

	local function footer()
		-- NOTE: requires the fortune-mod package to work
		-- local handle = io.popen("fortune")
		-- local fortune = handle:read("*a")
		-- handle:close()
		-- return fortune
		return "cesaralvarod 🤖"
	end

	dashboard.section.footer.val = footer()

	dashboard.section.footer.opts.hl = "Type"
	dashboard.section.header.opts.hl = "Include"
	dashboard.section.buttons.opts.hl = "Keyword"

	dashboard.opts.opts.noautocmd = true
	-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
	alpha.setup(dashboard.opts)
end

return {
	"goolord/alpha-nvim",
	lazy = false,
	config = config,
}
