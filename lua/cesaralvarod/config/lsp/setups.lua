local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lspconfig = require("lspconfig")
local navic = require("nvim-navic")
local lspformat = require("lsp-format")

local configs = require("lspconfig.configs")

-- Configurar EFM para usar Prettier
-- local prettier         = {
--   formatCommand = "prettier --stdin-filepath ${INPUT}",
--   formatStdin = true
-- }

-- FORMAT EFM language server

-- NOTE: https://github.com/creativenull/efmls-configs-nvim/blob/main/doc/SUPPORTED_LIST.md

local prettier = require("efmls-configs.formatters.prettier")
local stylua = require("efmls-configs.formatters.stylua")
local blade_formatter = require("efmls-configs.formatters.blade_formatter")
local astyle = require("efmls-configs.formatters.astyle")
local autopep8 = require("efmls-configs.formatters.autopep8")
local php_cs_fixer = require("efmls-configs.formatters.php_cs_fixer")
local beautysh = require("efmls-configs.formatters.beautysh")

local efm_languages = {
  javascript = { prettier },
  javascriptreact = { prettier },
  typescript = { prettier },
  typescriptreact = { prettier },
  json = { prettier },
  html = { prettier },
  css = { prettier },
  scss = { prettier },
  yaml = { prettier },
  markdown = { prettier },
  lua = { stylua },
  blade = { blade_formatter },
  c = { astyle },
  cpp = { astyle },
  python = { autopep8 },
  php = {
    php_cs_fixer,
  },
  bash = { beautysh },
}

--

if not configs.intelephense then
  configs.intelephense = {
    default_config = {
      cmd = { "intelephense", "--stdio" },
      filetypes = { "php", "blade" },
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

-- arduino
-- local MY_FQBN = "arduino:avr:nano"

return setmetatable({
  -- EFM
  efm = function()
    return {
      on_attach = lspformat.on_attach,
      init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
      },
      settings = {
        rootMarkers = { ".git/" },
        languages = efm_languages,
      },
      filetypes = vim.tbl_keys(efm_languages),
    }
  end,

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
    }
  end,

  eslint = function()
    return {
      capabilities = capabilities,
      root_dir = lspconfig.util.root_pattern(
        ".eslintrc",
        ".eslintrc.js",
        ".eslintrc.json",
        ".eslintrc.yaml",
        "eslint.config.mjs",
        "eslint.config.js",
        "eslint.config.cjs",
        ".git"
      ),
      settings = {
        codeAction = {
          disableRuleComment = {
            enable = true,
            location = "separateLine",
          },
          showDocumentation = {
            enable = true,
          },
        },
        format = {
          enable = false,
        },
        lint = {
          enable = true,
          rules = {
            ["no-unused-vars"] = "warn",
            ["no-console"] = "off",
          },
        },
      },
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
        "blade",
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
          -- formatter
          -- format = {
          --   enable = true,
          --   defaultConfig = {
          --     indent_style = "space",
          --     indent_size = "2",
          --     quote_style = "double",
          --     trailing_newline = true,
          --     insert_final_newline = true,
          --   },
          -- },
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
      filetypes = { "php", "blade" },
    }
  end,

  prettier = function()
    return {
      capabilities = capabilities,
    }
  end,

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
        "build.xml",       -- Ant
        "pom.xml",         -- Maven
        "settings.gradle", -- Gradle
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
