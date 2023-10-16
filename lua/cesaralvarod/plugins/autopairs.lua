local config = function()
	local npairs = require("nvim-autopairs")

	-- options
	local opts = {
		enable_check_bracket_line = false, -- dont add pairs if it already has a close pair in the same line
		check_ts = true,
		ts_config = {
			lua = {
				"string",
				"source",
			},
			javascript = {
				"string",
				"template_string",
			},
			java = false,
			-- fast wrap when press <A-e>
			fast_wrap = {
				map = "<A-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = string.gsub([=[[%'%"%)%>%]%)%}%,]]=], "%s+", ""),
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
		},
	}

	-- setup
	npairs.setup(opts)
end

return {
	"windwp/nvim-autopairs",

	config = config,
	event = "InsertEnter",
}
