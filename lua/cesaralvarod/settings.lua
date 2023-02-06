local opt = vim.opt -- Set options (global/buffer/ window-scoped)
local g = vim.g
local cache_dir = vim.env.HOME .. "/.cache/nvim/"

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
opt.smartindent = true -- Auto indent new lines
opt.linebreak = true -- Line break when is not space
opt.breakindent = true -- Line break config
opt.whichwrap = "h,l,<,>,[,],~"
opt.showbreak = "↳ "
opt.breakindentopt = "shift:2,min:20"

---------------------------------------------------------
-- Memory, CPU
---------------------------------------------------------

opt.hidden = true -- Enable background buffers
opt.updatetime = 300 -- ms to wait for trigger an event
opt.undodir = cache_dir .. "undo/"
opt.lazyredraw = true -- Faster scrolling
opt.undofile = true -- Persistent undo history
opt.pastetoggle = "<F2>"
opt.swapfile = false
opt.autoread = true
opt.history = 2000
opt.backup = false
opt.writebackup = false

---------------------------------------------------------
-- Variables
---------------------------------------------------------

g.netrw_liststyle = 3
g.python3_host_prog = "/usr/bin/python3" -- use system python (useful when working with virtualenvs)
