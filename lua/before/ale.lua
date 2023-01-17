local g = vim.g

g.ale_list_window_size = 5
g.ale_set_quickfix = 1

g.ale_disable_lsp = 1

g.ale_echo_msg_format = "[%linter%] %s [%severity%]"
g.ale_fix_on_save = 1

g.ale_linters_aliases = {
  jsx = { "css", "javascript", "javascript.jsx" },
  tsx = { "javascript", "typescript", "typescript.tsx" },
}

g.ale_fixers = {
  all = { "prettier" },
  javascript = { "prettier" },
  typescript = { "prettier" },
  rust = { "prettier" },
  java = { "prettier" },
  vim = { "prettier" },
  lua = { "prettier", "stylua" },
  r = { "prettier" },
  vue = { "prettier" },
  python = { "autopep8" },
  scss = { "prettier" },
  sass = { "prettier" },
  json = { "prettier" },
  html = { "prettier" },
  css = { "prettier" },
  cpp = { "clang" },
  c = { "clang" },
  javascriptreact = { "prettier" },
  typescriptreact = { "prettier" },
}

g.ale_linters = {
  typescript = { "tsserver" },
  typescriptreact = { "tsserver" },
  javascript = { "tsserver", "eslint" },
  javascriptreact = { "tsserver", "eslint" },
  json = { "tsserver", "eslint" },
  jsx = { "eslint" },
  css = { "eslint", "stylelint" },
  vue = { "vls" },
  lua = { "luac" },
  c = { "clang" },
  cpp = { "clang" },
  sh = { "language_server" },
}

g.ale_lint_on_enter = 1
g.ale_lint_on_filetype_changed = 1
g.ale_lint_on_insert_leave = 1
g.ale_lint_on_save = 1
g.ale_lint_on_text_changed = "normal"
