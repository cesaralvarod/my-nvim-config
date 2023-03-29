local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

local startup = function(use)
	use("mg979/vim-visual-multi") -- multiple cursor
	use({
		"iamcco/markdown-preview.nvim", -- markdown previewer
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	use("ibhagwan/fzf-lua") -- Fuzzy finder
	use({
		"kkoomen/vim-doge", -- Generate documentation
		run = ":call doge#install()",
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end

-- Load plugins

return require("packer").startup(startup)
