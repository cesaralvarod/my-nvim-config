local config = function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local cmp_git = require("cmp_git")

  local vscode_loaders = require("luasnip/loaders/from_vscode")

  local icons = require("cesaralvarod.config.icons")

  -- autopairs completion
  local cmp_npairs = require("nvim-autopairs.completion.cmp")
  cmp.event:on("confirm_done", cmp_npairs.on_confirm_done({ map_char = { tex = "" } }))

  -- others fitypes supported
  luasnip.filetype_extend("javascript", { "javascriptreact" })
  luasnip.filetype_extend("javascript", { "html" })
  luasnip.filetype_extend("typescript", { "typescriptreact" })
  luasnip.filetype_extend("typescript", { "html" })

  -- custom snippets
  local snip = luasnip.snippet
  local text = luasnip.text_node
  local insert = luasnip.insert_node

  -- custom snippets for php
  luasnip.add_snippets(nil, {
    all = {
      snip({
        trig = "php",
        namr = "php",
        dscr = "Create php labels",
      }, {
        text("<?php "),
        insert(1),
        text(" ?>"),
      }),
    },
  })

  -- luasnip vscode loaders
  vscode_loaders.lazy_load()

  -- check backspace
  local check_backspace = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
  end

  local source_mapping = {
    nvim_lsp = "[LSP]",
    emoji = "[Emoji]",
    path = "[Path]",
    calc = "[Calc]",
    cmp_tabnine = "[Tabnine]",
    vsnip = "[Snippet]",
    luasnip = "[Snippet]",
    buffer = "[Buffer]",
    tmux = "[TMUX]",
    copilot = "[Copilot]",
    treesitter = "[TreeSitter]",
    git = "[Git]",
  }

  local opts = {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      completion = {
        -- border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        scrollbar = "║",
      },
      documentation = {
        -- border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        scrollbar = "║",
      },
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      kind_icons = icons.kind,
      source_names = source_mapping,
      duplicates_default = 0,
      format = function(entry, vim_item)
        vim_item.kind = string.format("%s", icons.kind[vim_item.kind])
        vim_item.menu = source_mapping[entry.source.name]

        if entry.source.name == "cmp_tabnine" then
          local detail = (entry.completion_item.data or {}).detail
          vim_item.kind = ""

          if detail and detail:find(".*%%.*") then
            vim_item.kind = vim_item.kind .. " " .. detail
          end

          if (entry.completion_item.data or {}).multiline then
            vim_item.kind = vim_item.kind .. " " .. "[ML]"
          end
        end

        local maxwidth = 80

        vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)

        return vim_item
      end,
    },
    -- mappings
    mapping = {
      ["<C-k>"] = cmp.mapping.select_prev_item(), -- select previous item
      ["<C-j>"] = cmp.mapping.select_next_item(), -- select next item

      ["<Down>"] = cmp.mapping.select_next_item(),
      ["<Up>"] = cmp.mapping.select_prev_item(),

      -- scroll docs in cmp
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),

      -- complete
      ["<C-space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

      ["<C-y>"] = cmp.config.disable,

      -- close or abort completation
      ["<C-c>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),

      -- confirm selection
      -- ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<C-l>"] = cmp.mapping.confirm({ select = true }),

      -- move
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif check_backspace() then
          fallback()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),

      -- move
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
    sources = {
      { name = "nvim_lsp" },
      -- { name = "nvim_lua" }, -- no with neodev
      { name = "emoji" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
      { name = "nvim_lsp_signature_help" },
      { name = "latex_symbols" },
      { name = "cmp_tabnine" },
      { name = "cmp_git" },
    },
    experimental = {
      ghost_text = true,
      native_menu = false,
    },
  }

  -- setup
  cmp.setup(opts)

  -- cmp_git
  cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
      { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = "buffer" },
    }),
  })

  -- cmp git setup
  cmp_git.setup()

  -- cmp-cmdline config
  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      {
        name = "cmdline",
        options = {
          ignore_cmds = { "Man", "|" },
        },
      },
    }),
  })
end

return {
  {
    "hrsh7th/nvim-cmp",
    commit = "b356f2c",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",                                                            -- Autocomplete lsp
      "hrsh7th/cmp-nvim-lua",                                                            -- Autocomplete lua global variables (vim)
      "hrsh7th/cmp-buffer",                                                              -- Autcomplete buffer
      "hrsh7th/cmp-emoji",                                                               -- Autocomplete emojis
      "hrsh7th/cmp-path",                                                                -- Autocomplete paths
      "hrsh7th/cmp-cmdline",                                                             -- Autocomplete cmdline
      "hrsh7th/cmp-nvim-lsp-signature-help",                                             -- Autocomplete signatures
      "kdheepak/cmp-latex-symbols",                                                      -- Autocomplete symbols
      "saadparwaiz1/cmp_luasnip",                                                        -- Autocomplete snippets lua
      "petertriho/cmp-git",                                                              -- Autocomplete git

      "windwp/nvim-autopairs",                                                           -- Autocomplete pairs

      { "L3MON4D3/LuaSnip",    version = "v2*",       build = "make install_jsregexp" }, -- snippet engine
      "rafamadriz/friendly-snippets",                                                    -- useful snippets
      { "tzachar/cmp-tabnine", build = "./install.sh" },
    },

    event = "InsertEnter",
    config = config,
  },

  -- format rust
  {
    "rust-lang/rust.vim",
    ft = "rust",

    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  -- rust debugging and tools
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/nvim-cmp",
    },
    opts = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local on_attach = function(client, bufnr)
        client.offset_encoding = "utf-16"
      end

      return {
        server = {
          on_attach = on_attach,
          capabilities = capabilities,
        },
      }
    end,

    config = function(_, opts)
      local rust_tools = require("rust-tools")

      rust_tools.setup(opts)
    end,
  },
}
