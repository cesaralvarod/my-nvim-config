local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lspconfig = require("lspconfig")
local navic = require("nvim-navic")

local configs = require("lspconfig.configs")

local organize_imports = function()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {
      vim.api.nvim_buf_get_name(0),
    },
  }

  vim.lsp.buf.execute_command(params)
end

-- Configurar EFM para usar Prettier
local prettier = {
  formatCommand = "prettier --stdin-filepath ${INPUT}",
  formatStdin = true
}

if not configs.intelephense then
  configs.intelephense = {
    default_config = {
      cmd = { "intelephense", "--stdio" },
      filetypes = { "php" },
      root_dir = function(fname)
        return vim.loop.cwd()
      end,
      settings = {
        intelephense = {
          files = {
            maxSize = 1000000,
          },
          environment = {},
        },
      },
    },
  }
end

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

local MY_FQBN = "arduino:avr:nano"

return setmetatable({
  --[[ rome = function()
		return {
			root_dir = lspconfig.util.root_pattern("rome.json"),
		}
	end, ]]

  denols = function()
    return {
      root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", "import_map.json"),
    }
  end,

  tsserver = function()
    return {
      capabilities = capabilities,
      root_dir = lspconfig.util.root_pattern(
        "package.json",
        "tsconfig.json",
        "jsconfig.json",
        "gulpfile.js",
        "node_modules"
      ),
      single_file_support = true,
      init_options = {
        preferences = {
          disableSuggestions = true,
        },
      },

      commands = {
        OrganizeImports = {
          organize_imports,
          description = "Organize Imports",
        },
      },


    }
  end,

  eslint = function()
    return {
      capabilities = capabilities,
      root_dir = lspconfig.util.root_pattern(
        ".eslintrc", ".eslintrc.js", ".eslintrc.json", ".eslintrc.yaml", "eslint.config.mjs", "eslint.config.js",
        'eslint.config.cjs', '.git'
      ),
      settings = {
        codeAction = {
          disableRuleComment = {
            enable = true,
            location = "separateLine"
          },
          showDocumentation = {
            enable = true
          },
        },
        format = {
          enable = false
        },
        lint = {
          enable = true,
          rules = {
            ["no-unused-vars"] = "warn",
            ["no-console"] = "off",
          },
        },
      }
    }
  end,


  efm = function()
    return {
      init_options = { documentFormatting = true },
      settings = {
        rootMarkers = { ".git/" },
        languages = {
          javascript = { prettier },
          javascriptreact = { prettier },
          typescript = { prettier },
          typescriptreact = { prettier },
          json = { prettier },
          html = { prettier },
          css = { prettier },
          scss = { prettier },
          yaml = { prettier },
          markdown = { prettier }
        }
      },
      filetypes = {
        "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "html", "css", "scss", "yaml",
        "markdown"
      }
    }
  end,

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

  --[[ 	arduino_language_server = function()
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
	end, ]]

  emmet_ls = function()
    return {
      capabilities = capabilities,
      filetypes = {
        "html",
        "typescriptreact",
        "javascriptreact",
        "css",
        "sass",
        "scss",
        "less",
        "eruby",
        "vue",
        "php",
      },
      root_dir = function(fname)
        return vim.fn.getcwd()
      end,
    }
  end,

  lua_ls = function()
    return {
      capabilities = capabilities,
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace",
          },
          runtime = {
            version = "LuaJIT", -- in case of neovim
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
          hint = {
            enable = true,
          },
        },
      },
    }
  end,

  clangd = function()
    return {
      capabilities = capabilities,
      root_dir = function(fname)
        return vim.fn.getcwd()
      end,
      on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
      end,
    }
  end,

  intelephense = function()
    return {
      capabilities = capabilities,
      root_dir = lspconfig.util.root_pattern(".git", "composer.json"),
    }
  end,

  prettier = function()
    return {
      capabilities = capabilities,
    }
  end,



  -- unnecessary with rust.vim
  --[[ 	rust_analyzer = function()
		return {
			capabilities = capabilities,
			filetypes = { "rust" },
			root_dir = require("lspconfig").util.root_pattern("Cargo.toml"),
			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = true,
					},
				},
			},
		}
	end, ]]

  gopls = function()
    return {
      capabilities = capabilities,
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
    }
  end,

  jdtls = function()
    return {
      capabilities = capabilities,
      root_dir = lspconfig.util.root_pattern(
        "build.xml",           -- Ant
        "pom.xml",             -- Maven
        "settings.gradle",     -- Gradle
        "settings.gradle.kts", -- Gradle
        -- Multi-module projects
        "build.gradle",
        "build.gradle.kts"
      ),
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
        on_attach = function(client, bufnr)
          client.offset_encoding = "utf-16"

          if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr) -- nvim-navic
          end

          -- disable semanticTokensProvider from LSP
          -- client.server_capabilities.semanticTokensProvider = nil

          local active_clients = vim.lsp.get_active_clients()

          -- deno config
          if lspconfig.util.root_pattern("deno.json", "deno.jsonc", "import_map.json")(vim.fn.getcwd()) then
            for _, client_ in pairs(active_clients) do
              if client_.name == "tsserver" then
                client_.stop()
              end
            end
          end
        end,
      }
    end
  end,
})
