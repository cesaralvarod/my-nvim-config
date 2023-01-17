local null_ls = require("null-ls")

-- code action sources
local code_actions = null_ls.builtins.code_actions

-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics

-- formatting sources
local formatting = null_ls.builtins.formatting

-- hover sources
local hover = null_ls.builtins.hover

-- completion sources
local completion = null_ls.builtins.completion

local sources = {

	-- Importants
	formatting.trim_whitespace.with({
		disabled_filetypes = { "sql", "mysql" },
	}),
	formatting.trim_newlines.with({
		disabled_filetypes = { "sql", "mysql" },
	}),

	-- FORMATTING
	--formatting.prettier.with({
	-- extra_filetypes = {},
	-- }),
	formatting.prettier, -- js, ts, tsx, jsx, css, html, etc files
	formatting.autopep8, -- python files
	formatting.stylua, -- lua files
	formatting.beautysh, -- sh file
	formatting.clang_format, -- java, cpp, c, cuda files
	formatting.phpcsfixer, -- php files
	formatting.astyle, -- java files
	formatting.fixjson, -- json files
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
	-- if client.server_capabilities.documentFormattingProvider then
	-- 	vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
	-- end

	-- Documentation
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
				-- vim.lsp.buf.format() -- Format sync
				async_formatting(bufnr) -- Format async
			end,
		})
	end
end

null_ls.setup({
	sources = sources,
	on_attach = on_attach,
})

-- :echo executable("<SOURCE>") para ver si existe el ejecutable de ese lsp server
