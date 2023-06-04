local opt = vim.opt -- Set options (global/buffer/ window-scoped)
local cache_dir = vim.env.HOME .. "/.cache/nvim/"

local g = vim.g

-------------------------------------------------------------
-- Rainbow
-------------------------------------------------------------

g.rainbow_active = 1

-------------------------------------------------------------
-- Closetags
-------------------------------------------------------------

-- filenames like *.xml, *.html, *.xhtml, ...
-- These are the file extensions where this plugin is enabled.

g.closetag_filenames = "*.html,*.xhtml,*.phtml"

-- filenames like *.xml, *.xhtml, ...
-- This will make the list of non-closing tags self-closing in the specified files.

g.closetag_xhtml_filenames = "*.xhtml,*.jsx"

-- filetypes like xml, html, xhtml, ...
-- These are the file types where this plugin is enabled.

g.closetag_filetypes = "html,xhtml,phtml"

-- filetypes like xml, xhtml, ...
-- This will make the list of non-closing tags self-closing in the specified files.

g.closetag_xhtml_filetypes = "xhtml,jsx"

-- integer value [0|1]
-- This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)

g.closetag_emptyTags_caseSensitive = 1

-- Shortcut for closing tags, default is '>'

g.closetag_shortcut = ">"

-- Add > at current position without closing the current tag, default is ''

g.closetag_close_shortcut = "<leader>>"

g.closetag_enable_react_fragment = 1

--------------------------------------------------------
-- Filetypes
--------------------------------------------------------

vim.cmd("autocmd BufNewFile,BufRead *.ejs set filetype=html")
vim.cmd("autocmd BufNewFile,BufEnter,BufRead *.astro set filetype=astro")
vim.cmd("autocmd BufNewFile,BufEnter,BufRead *.conf set filetype=conf")
vim.cmd("autocmd BufNewFile,BufEnter,BufRead artisan set filetype=php")

--------------------------------------------------------
-- Vim Polyglot
--------------------------------------------------------

vim.g["polyglot_disabled"] = { "astro" }

---------------------------------------------------------
-- General
---------------------------------------------------------

opt.mouse = "a" -- Enable mouse support
opt.clipboard = "unnamedplus" -- Copy/paste to system clipboard
opt.swapfile = false -- Don't use swapfile
opt.spell = false -- Spell checking
opt.spelllang = "en_us" -- Check language
opt.magic = true
opt.spelloptions = "camel"

---------------------------------------------------------
-- Neovim UI
---------------------------------------------------------

opt.background = "dark"
opt.number = true -- Show line number
opt.relativenumber = true -- Relative number
opt.showmatch = true -- Highlight matching parenthesis
opt.smartcase = true -- Ignore lowercase for whole pattern
opt.ignorecase = true -- Ignore case letter when search
opt.infercase = true
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.splitbelow = true -- Horizontal split to the bottom
opt.splitright = true -- Vertical split to the bottom
opt.cursorline = true -- Cursor line while writing
opt.signcolumn = "yes" -- Space between window and numbers column
opt.laststatus = 2 -- Set global statusline
opt.showcmd = false
-- opt.cmdheight = 1
opt.ruler = false
opt.foldmethod = "marker" -- Enable folding (default 'foldmarker')

---------------------------------------------------------
-- Tabs, Indent
---------------------------------------------------------

opt.wrap = true -- Wrap line
opt.smarttab = true
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2 -- Shift 4 spaces when tab
opt.tabstop = 2 -- 1 tab == 2 spaces
opt.softtabstop = 2 -- 1 tab == 2 spaces
opt.smartindent = false -- Auto indent new lines
opt.autoindent = false
opt.breakindent = true -- Line break config
opt.linebreak = true -- Line break when is not space
opt.whichwrap = "h,l,<,>,[,],~"
opt.showbreak = "↳ "
opt.breakindentopt = "shift:2,min:20"

function DisableAutoIndent()
	vim.o.autoindent = false
	vim.opt.autoindent = false
	vim.opt.paste = false
end

function EnableAutoIndent()
	vim.o.autoindent = true
	vim.opt.autoindent = true
	vim.opt.paste = false
end

vim.cmd("autocmd InsertEnter * lua DisableAutoIndent()")
vim.cmd("autocmd InsertLeave * lua EnableAutoIndent()")

---------------------------------------------------------
-- Memory, CPU
---------------------------------------------------------

opt.hidden = true -- Enable background buffers
opt.updatetime = 300 -- ms to wait for trigger an event
opt.undodir = cache_dir .. "undo/"
opt.lazyredraw = true -- Faster scrolling
opt.undofile = true -- Persistent undo history
opt.paste = false
opt.pastetoggle = "<F2>"
opt.swapfile = false
opt.autoread = true
opt.history = 2000
opt.backup = false
opt.writebackup = false

---------------------------------------------------------
-- Variables
---------------------------------------------------------

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.netrw_liststyle = 3
g.netrw_hide = 1
g.python3_host_prog = "/usr/bin/python3" -- use system python (useful when working with virtualenvs)
