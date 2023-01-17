-- General keymaps that are not pluggin dependant
-- The file /lua/lsp/utils.lua contains lsp-specific commands

local Utils = require("utils")

-- local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
-- local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
local tnoremap = Utils.tnoremap
-- local nmap = Utils.nmap
-- local xmap = Utils.xmap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 1. Save documents

nnoremap("<leader>w", ":w<CR>") -- Save document with Space+w / Normal Mode
nnoremap("<leader>wa", ":wa<CR>") -- Save all documents with Space+w+a / Normal Mode
inoremap("<c-s>", "<c-o>:w<CR>") -- Save document with Ctrl+s / Insert Mode
nnoremap("<c-s>", ":w<CR>") -- Save document with Ctrl+s / Normal Mode
inoremap("<c-a>", "<c-o>:wa<CR>") -- Save all documents with Ctrl+a / Insert Mode
nnoremap("<c-a>", ":wa<CR>") -- Save all documents with Ctrl+a / Normal Mode
nnoremap("<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>") -- Format

-- 2. Quit document

nnoremap("<leader>q", ":wq<CR>") -- Save and quit document with Space+q / Normal Mode
nnoremap("<leader>qq", ":q!<CR>") -- Quit document without save with Space+q+q (two times) / Normal Mode

-- 3. Add semicolon

nnoremap("<leader>;", "$a;<Esc><CR>")

-- 4. Faster scrolling

nnoremap("J", "10<C-e>") -- Up 10 lines
nnoremap("K", "10<C-y>") -- Down 10 lines

-- 5. Move around windows

tnoremap("<C-h>", "<C-\\><C-n><C-w>h") -- LEFT / Terminal mode
tnoremap("<C-j>", "<C-\\><C-n><C-w>j") -- UP / Terminal mode
tnoremap("<C-k>", "<C-\\><C-n><C-w>k") -- DOWN / Terminal mode
tnoremap("<C-l>", "<C-\\><C-n><C-w>l") -- RIGHT / Terminal mode
tnoremap("<A-h>", "<C-\\><C-n><C-w>h") -- LEFT / Terminal mode
tnoremap("<A-j>", "<C-\\><C-n><C-w>j") -- UP / Terminal mode
tnoremap("<A-k>", "<C-\\><C-n><C-w>k") -- DOWN / Terminal mode
tnoremap("<A-l>", "<C-\\><C-n><C-w>l") -- RIGHT / Terminal mode

nnoremap("<C-h>", "<C-w>h") -- LEFT
nnoremap("<C-j>", "<C-w>j") -- UP
nnoremap("<C-k>", "<C-w>k") -- DOWN
nnoremap("<C-l>", "<C-w>l") -- RIGHT
nnoremap("<A-h>", "<C-w>h") -- LEFT
nnoremap("<A-j>", "<C-w>j") -- UP
nnoremap("<A-k>", "<C-w>k") -- DOWN
nnoremap("<A-l>", "<C-w>l") -- RIGHT

-- 6. Buffers

nnoremap("<leader>k", ":bnext<CR>") -- Next buffer
nnoremap("<leader>j", ":bprevious<CR>") -- Previous buffer
nnoremap("<leader>0", ":bdelete<CR>") -- Delete buffer

-- 7. Yank to end of line

nnoremap("Y", "$")

-- 8. Splits

nnoremap("<leader>ws", ":split<CR>")
nnoremap("<leader>vs", ":vsplit<CR>")

-- 9. Telescope

nnoremap("<leader>f", ":Telescope find_files hidden=false<CR>")
nnoremap("<leader>fhf", ":Telescope find_files hidden=true<CR>")
nnoremap("<leader>b", ":Telescope buffers<CR>")
nnoremap("<leader>F", ":Telescope live_grep<CR>")
nnoremap("<leader>G", ":Telescope current_buffer_fuzzy_find<CR>")

-- 10. Codi

nnoremap("<leader>d", "<Cmd>Codi<CR>")

-- 11. Terminal

nnoremap("<C-c>", ":sp term://fish<CR>")
nnoremap("<C-z>", ":vsp term://fish<CR>")

-- 12. Nvim Tree

nnoremap("nt", "<Cmd>NvimTreeToggle<CR>")

-- 13. Bufferline

-- - Move to previous/next
nnoremap("<A-,>", "<Cmd>BufferLineCyclePrev<CR>")
nnoremap("<silent><A-.>", "<Cmd>BufferLineCycleNext<CR>")

-- - Re-order to previous/next
nnoremap("<A-<>", ":BufferLineMovePrev<CR>")
nnoremap("<A->>", ":BufferLineMoveNext<CR>")

-- - Goto buffer in position...
nnoremap("<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>")
nnoremap("<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>")
nnoremap("<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>")
nnoremap("<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>")
nnoremap("<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>")
nnoremap("<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>")
nnoremap("<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>")
nnoremap("<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>")
nnoremap("<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>")
nnoremap("<A-0>", "<Cmd>BufferLast<CR>")

-- 14. Sniprun

vnoremap("<leader>x", "<Cmd>SnipRun<CR>")

-- 15. LSP and diagnostics

nnoremap("gK", "<Cmd>:lua vim.lsp.buf.hover()<CR>")
nnoremap("gd", "<Cmd>:lua vim.lsp.buf.definition()<CR>")
nnoremap("gi", "<Cmd>:lua vim.lsp.buf.implementation()<CR>")
nnoremap("gr", "<Cmd>:lua vim.lsp.buf.references()<CR>")
nnoremap("gD", "<Cmd>:lua vim.lsp.buf.declaration()<CR>")
nnoremap("<space>K", "<Cmd>:lua vim.lsp.buf.signature_help()<CR>")

nnoremap("gt", "<Cmd>:lua vim.lsp.buf.type_definition()<CR>")
nnoremap("<leader>rn", "<Cmd>:lua vim.lsp.buf.rename()<CR>")
nnoremap("<leader>ca", "<Cmd>:lua vim.lsp.buf.code_action()<CR>")
nnoremap("ff", "<Cmd>:lua vim.lsp.buf.format({async=true})<CR>")
nnoremap("<leader>e", "<Cmd>:lua vim.diagnostic.open_float()<CR>")

nnoremap("[e", "<Cmd>lua vim.diagnostic.goto_prev()<CR>")
nnoremap("]e", "<Cmd>lua vim.diagnostic.goto_next()<CR>")

-- 16. Alternate Toggler
nnoremap("<leader><space>", "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>")

-- 17. Bookmarks
nnoremap("ma", "<cmd>lua require('telescope').extensions.vim_bookmarks.all()<CR>")
