local has_cmp, cmp = pcall(require, "cmp")
if not has_cmp then
	return
end

local has_luasnip, luasnip = pcall(require, "luasnip")
if not has_luasnip then
	return
end

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

-- Autopairs completion
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

local compare = require("cmp.config.compare")

local icons = require("cesaralvarod.icons")

-- Filetypes support
luasnip.filetype_extend("javascript", { "javascriptreact" })
luasnip.filetype_extend("javascript", { "html" })
luasnip.filetype_extend("typescript", { "typescriptreact" })
luasnip.filetype_extend("typescript", { "html" })

-- Adding custom snippets to lua

local snip = luasnip.snippet
local text = luasnip.text_node
local insert = luasnip.insert_node

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

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local cfg = {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		documentation = {
			border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
		},
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		kind_icons = icons.kind,
		source_names = {
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
		},
		duplicates_default = 0,
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s", icons.kind[vim_item.kind])
			-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				nvim_lua = "[API]",
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
			})[entry.source.name]

			return vim_item
		end,
	},
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<Down>"] = cmp.mapping.select_next_item(),
		["<Up>"] = cmp.mapping.select_prev_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-c>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		-- ["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-l>"] = cmp.mapping.confirm({ select = true }),
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
		ghost_text = false,
		native_menu = false,
	},
}

cmp.setup(cfg)

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

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
		{ name = "cmdline" },
	}),
})

require("cmp_git").setup()
