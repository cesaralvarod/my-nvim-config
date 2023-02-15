local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status_ok then
	return
end

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

local MY_FQBN = "arduino:avr:nano"

return setmetatable({
	angularls = function()
		local project_library_path = "/usr/lib/node_modules/@angular/language-server/" -- global npm
		local cmd = {
			"ngserver",
			"--stdio",
			"--tsProbeLocations",
			project_library_path,
			"--ngProbeLocations",
			project_library_path,
		}

		return {
			capabilities = capabilities,
			cmd = cmd,
			on_new_config = function(new_config, new_root_dir)
				new_config.cmd = cmd
			end,
		}
	end,
	arduino_language_server = function()
		return {
			capabilities = capabilities,
			root_dir = function(fname)
				return vim.fn.getcwd()
			end,
			cmd = {
				"arduino-language-server",
				"-cli-config",
				"$HOME/.arduino15/arduino-cli.yaml",
				"-fqbn",
				MY_FQBN,
			},
		}
	end,
	emmet_ls = function()
		return {
			capabilities = capabilities,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "eruby", "vue" },
			root_dir = function(fname)
				return vim.fn.getcwd()
			end,
		}
	end,
	sumneko_lua = function()
		return {
			capabilities = capabilities,
			root_dir = function(fname)
				return vim.fn.getcwd()
			end,
			on_attatch = function(client)
				client.offset_encoding = "utf-8"
			end,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						},
					},
				},
			},
		}
	end,
}, {
	__index = function()
		return function()
			return {
				capabilities = capabilities,
				root_dir = function(fname)
					return vim.fn.getcwd()
				end,
				on_attatch = function(client)
					client.offset_encoding = "utf-8"
				end,
			}
		end
	end,
})
