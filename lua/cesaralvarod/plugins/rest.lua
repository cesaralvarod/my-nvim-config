local config = function()
	local rest = require("rest-nvim")

	rest.setup({
		-- Open request results in a horizontal split
		result_split_horizontal = false,
		-- Keep the http file buffer above|left when split horizontal|vertical
		result_split_in_place = false,
		-- Skip SSL verification, useful for unknown certificates
		skip_ssl_verification = false,
		-- Encode URL before making request
		encode_url = true,
		highlight = {
			enabled = true,
			timeout = 150,
		},
		result = {
			show_url = true,
			show_http_info = true,
			show_headers = true,
			formatters = {
				json = "jq",
				--[[ html = function(body)
          -- Install tidy first
          -- return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
        end, ]]
			},
		},
		-- Jump to request line on run
		jump_to_request = false,
		env_file = ".env",
		custom_dynamic_variables = {},
		yank_dry_run = true,
	})

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "http",
		callback = function()
			local buff = tonumber(vim.fn.expand("<abuf>"), 10)
			vim.keymap.set("n", ";rr", rest.run, { noremap = true, buffer = buff })
		end,
	})
end

return {
	"NTBBloodbath/rest.nvim", -- Like postman
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = config,
}
