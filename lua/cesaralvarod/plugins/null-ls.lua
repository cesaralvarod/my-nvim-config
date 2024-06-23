local config = function()
	local null = require("null-ls")

	-- prettier.setup()

	-- builtins
	-- local code_actions = null.builtins.code_actions -- code action sources
	-- local diagnostics = null.builtins.diagnostics -- diagnostic sources
	local formatting = null.builtins.formatting -- formatting
	-- local hover = null.builtins.hover -- hover sources
	-- local completion = null.builtins.completion -- completion sources

	local sources = {

		-- FORMATTING
		formatting.trim_whitespace.with({
			disabled_filetypes = { "sql", "mysql" },
		}),
		formatting.trim_newlines.with({
			disabled_filetypes = { "sql", "mysql" },
		}),

		formatting.clang_format, -- C, C++ format

		formatting.stylua, -- lua files

		formatting.black, -- python files

		formatting.prettier, -- js, ts, tsx, jsx, css, html, etc files
		-- formatting.rome,

		formatting.beautysh, -- sh file

		formatting.phpcsfixer, -- php files

		formatting.fixjson, -- json files

		-- go
		formatting.gofumpt,
		formatting.goimports_reviser,
		formatting.golines,
	}

	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	-- Async formatting
	local async_formatting = function(bufnr)
		bufnr = bufnr or vim.api.nvim_get_current_buf()

		vim.lsp.buf_request(
			bufnr,
			"textDocument/formatting",
			vim.lsp.util.make_formatting_params({}),
			function(err, res, ctx)
				if err then
					local err_msg = type(err) == "string" and err or err.message
					-- you can modify the log message / level (or ignore it completely)
					vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
					return
				end

				-- don't apply results if buffer is unloaded or has been modified
				if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
					return
				end

				if res then
					local client = vim.lsp.get_client_by_id(ctx.client_id)

					-- Disable LSP servers formatting conflicts
					if
						client.name == "tsserver"
						or client.name == "lua_ls" -- troubles with stylua
						or client.name == "intelephense"
						or client.name == "html"
						or client.name == "jsonls"
						or client.name == "gopls"
					then
						client.server_capabilities.documentFormattingProvider = false
					end

					vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
					vim.api.nvim_buf_call(bufnr, function()
						vim.cmd("silent noautocmd update")
					end)
				end
			end
		)
	end

	-- Format on save
	local on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			-- clean any auto format
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			-- format on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- formatting(bufnr) -- Format sync
					async_formatting(bufnr) -- Format async
				end,
			})
		end
	end

	null.setup({
		sources = sources,
		on_attach = on_attach,
	})

	-- :echo executable("<SOURCE>") para ver si existe el ejecutable de ese lsp server
end

return {
	--[[ 	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		priority = 500,

		config = config,
	}, ]]
}
