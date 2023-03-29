local has_npairs, npairs = pcall(require, "nvim-autopairs")
if not has_npairs then
	return
end

npairs.setup({
	enable_check_bracket_line = false,
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false,
	},
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
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
})
