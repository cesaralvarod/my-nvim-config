local g = vim.g
g.coc_config_home = "~/.config/nvim/"
g.coc_global_extensions = {
  "coc-clangd",
  "coc-css",
  "coc-cssmodules",
  "coc-diagnostic",
  "coc-dictionary",
  "coc-docker",
  "coc-elixir",
  "coc-emmet",
  "coc-eslint",
  "coc-flutter",
  "coc-git",
  "coc-go",
  "coc-gocode",
  "coc-highlight",
  "coc-html",
  "coc-java",
  "coc-json",
  "coc-lua",
  "coc-marketplace",
  "coc-metals",
  "coc-phpls",
  "coc-prettier",
  --"coc-project",
  "coc-pyright",
  "coc-react-refactor",
  "coc-rust-analyzer",
  "coc-sh",
  "coc-snippets",
  "coc-solargraph",
  "coc-sourcekit",
  "coc-sql",
  "coc-styled-components",
  "coc-svg",
  "coc-tailwindcss",
  "coc-tslint-plugin",
  "coc-tsserver",
  "coc-vetur",
  "coc-vimlsp",
  "coc-webpack",
  "coc-word",
  "coc-xml",
  "coc-yaml",
  --"coc-yank",
  "coc-lists",
  "coc-pairs",
  -- 'coc-rust-analyzer'
}
-- Autocomplete
function _G.check_back_space()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

function _G.show_docs()
  local cw = fn.expand("<cword>")
  if fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
    cmd("h " .. cw)
  elseif api.nvim_eval("coc#rpc#ready()") then
    fn.CocActionAsync("doHover")
  else
    cmd("!" .. vim.o.keywordprg .. " " .. cw)
  end
end

local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
local api = vim.api
api.nvim_set_keymap(
  "i",
  "<TAB>",
  'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
  opts
)
api.nvim_set_keymap("i", "<S-TAB>", [[coc#pum#visible() ?  coc#pum#prev(1) : "\<C-h>"]], opts)
api.nvim_set_keymap("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]], opts)
api.nvim_set_keymap("i", "<C-space>", "coc#refresh()", opts)
