local icons = require("icons")

local signs = {
	Error = icons.signslsp.Error,
	Warn = icons.signslsp.Warning,
	Hint = icons.signslsp.Hint,
	Info = icons.signslsp.Information,
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
