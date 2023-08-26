local config = function()
	local null = require("null-ls")
	-- local prettier = require("prettier")

	-- prettier.setup()

	-- BUILTINS

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
		formatting.prettier, -- js, ts, tsx, jsx, css, html, etc files
		formatting.autopep8, -- python files
		formatting.stylua, -- lua files
		formatting.beautysh, -- sh file
		formatting.clang_format, -- java, cpp, c, cuda files
		formatting.phpcsfixer, -- php files
		formatting.astyle, -- java, c and c++ files
		formatting.fixjson, -- json files
		formatting.rustfmt, -- rust files
		formatting.gofmt,
		-- formatting.rome,
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
						client.name == "lua_ls"
						or client.name == "tsserver"
						or client.name == "intelephense"
						or client.name == "html"
						or client.name == "jsonls"
						or client.name == "gopls"
						or client.name == "clangd"
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

	--[[ 	local formatting = function(bufnr)
		bufnr = bufnr or vim.api.nvim_get_current_buf()

		-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
		vim.lsp.buf.format({
			bufnr = bufnr,
			filter = function(client)
				if client.name == "intelephense" then
					return client.name == "intelephense"
				end

				return client.name == "null-ls"
			end,
		})
	end ]]
	-- Format on save
	local on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
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
	"jose-elias-alvarez/null-ls.nvim",
	lazy = false,
	priority = 500,
	config = config,
}
