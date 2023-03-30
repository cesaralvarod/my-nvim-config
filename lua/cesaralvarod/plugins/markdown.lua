return {
	"iamcco/markdown-preview.nvim", -- markdown previewer
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
}
