return {
	"cesaralvarod/tokyogogh.nvim",
	dir = "~/workspace/tokyogogh/",
	config = function()
		require("tokyogogh").setup()

		vim.cmd([[colorscheme tokyogogh]])
	end,
}
