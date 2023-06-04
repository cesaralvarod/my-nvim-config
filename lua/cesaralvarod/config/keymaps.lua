-- General keymaps that are not pluggin dependant
-- The file /lua/lsp/utils.lua contains lsp-specific commands

local Utils = require("cesaralvarod.utils")

-- local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
-- local vnoremap = Utils.vnoremap
-- local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
local tnoremap = Utils.tnoremap
-- local nmap = Utils.nmap
-- local xmap = Utils.xmap

inoremap("??'", "¿")
inoremap("!!'", "¡")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 1. Save documents

nnoremap("<leader>w", ":w<CR>") -- Save document with Space+w / Normal Mode
nnoremap("<leader>wa", ":wa<CR>") -- Save all documents with Space+w+a / Normal Mode
inoremap("<c-s>", "<c-o>:w<CR>") -- Save document with Ctrl+s / Insert Mode
nnoremap("<c-s>", ":w<CR>") -- Save document with Ctrl+s / Normal Mode
inoremap("<c-a>", "<c-o>:wa<CR>") -- Save all documents with Ctrl+a / Insert Mode
nnoremap("<c-a>", ":wa<CR>") -- Save all documents with Ctrl+a / Normal Mode
nnoremap("<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>") -- Format

-- 2. Quit document

nnoremap("<leader>q", ":wq<CR>") -- Save and quit document with Space+q / Normal Mode
nnoremap("<leader>qq", ":q!<CR>") -- Quit document without save with Space+q+q (two times) / Normal Mode

-- 3. Add semicolon

nnoremap("<leader>;", "$a;<Esc><CR>")

-- 4. Faster scrolling

nnoremap("J", "10<C-e>") -- Up 10 lines
nnoremap("K", "10<C-y>") -- Down 10 lines

nnoremap("H", "5k")
nnoremap("L", "5j")

-- 5. Move around windows

tnoremap("<C-h>", "<C-\\><C-n><C-w>h") -- LEFT / Terminal mode
tnoremap("<C-j>", "<C-\\><C-n><C-w>j") -- UP / Terminal mode
tnoremap("<C-k>", "<C-\\><C-n><C-w>k") -- DOWN / Terminal mode
tnoremap("<C-l>", "<C-\\><C-n><C-w>l") -- RIGHT / Terminal mode

nnoremap("<C-h>", "<C-w>h") -- LEFT
nnoremap("<C-j>", "<C-w>j") -- UP
nnoremap("<C-k>", "<C-w>k") -- DOWN
nnoremap("<C-l>", "<C-w>l") -- RIGHT

-- 6. Vsplit and split

-- vnoremap("<C-j>", ":m '>+1<cr>gv=gv")
-- vnoremap("<C-k>", ":m '<-2<cr>gv=gv")

-- 7. Replace word fast

nnoremap(";a", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
nnoremap(";s", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left><Left>]])

-- 7. Move with cursor in the middle
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- 7. Buffers

nnoremap("<leader>k", ":bnext<CR>") -- Next buffer
nnoremap("<leader>j", ":bprevious<CR>") -- Previous buffer
nnoremap("<leader>0", ":bdelete<CR>") -- Delete buffer

-- 8. Yank to end of line

nnoremap("Y", "$")

-- 9. Splits

nnoremap("<leader>ws", ":split<CR>")
nnoremap("<leader>vs", ":vsplit<CR>")

-- 10. Terminal

nnoremap("<A-x>", ":sp term://fish<CR>")
nnoremap("<A-z>", ":vsp term://fish<CR>")

-- 12. Bufferline

-- Picking
nnoremap("<A-o>", "<Cmd>BufferLinePick<CR>")
nnoremap("<A-c>", "<Cmd>BufferLinePickClose<CR>")

-- Pin
nnoremap("<A-p>", "<Cmd>BufferLineTogglePin<CR>")

-- - Move to previous/next
nnoremap("<A-,>", "<Cmd>BufferLineCyclePrev<CR>")
nnoremap("<silent><A-.>", "<Cmd>BufferLineCycleNext<CR>")

-- - Re-order to previous/next
nnoremap("<A-<>", ":BufferLineMovePrev<CR>")
nnoremap("<A->>", ":BufferLineMoveNext<CR>")

-- - Goto buffer in position...
for i = 1, 9 do
	nnoremap(("<A-%s>"):format(i), ("<Cmd>BufferLineGoToBuffer %s<CR>"):format(i))
end

nnoremap("<A-0>", "<Cmd>BufferLast<CR>")

-- 13. LSP and diagnostics

nnoremap("<leader>h", "<Cmd>:lua vim.lsp.buf.hover()<CR>")
nnoremap("<space>K", "<Cmd>:lua vim.lsp.buf.signature_help()<CR>")
nnoremap("gd", "<Cmd>:lua vim.lsp.buf.definition()<CR>")
nnoremap("gi", "<Cmd>:lua vim.lsp.buf.implementation()<CR>")
nnoremap("gr", "<Cmd>:lua vim.lsp.buf.references()<CR>")
nnoremap("gD", "<Cmd>:lua vim.lsp.buf.declaration()<CR>")

nnoremap("gt", "<Cmd>:lua vim.lsp.buf.type_definition()<CR>")
nnoremap("<leader>rn", "<Cmd>:lua vim.lsp.buf.rename()<CR>")
nnoremap("<leader>vca", "<Cmd>:lua vim.lsp.buf.code_action()<CR>")
nnoremap("<C-f>", "<Cmd>:lua vim.lsp.buf.format({async=true})<CR>")
nnoremap("<leader>e", "<Cmd>:lua vim.diagnostic.open_float()<CR>")

nnoremap("<leader>vp", "<Cmd>lua vim.diagnostic.goto_prev()<CR>")
nnoremap("<leader>vn", "<Cmd>lua vim.diagnostic.goto_next()<CR>")

-- 16.TodoTelescope

nnoremap("<leader><tab>", "<cmd>TodoTelescope<CR>")

-- 24. Gitsigns

nnoremap("]h", "<cmd>Gitsigns next_hunk<cr>")
nnoremap("[h", "<cmd>Gitsigns prev_hunk<cr>")

nnoremap("ghr", "<cmd>Gitsigns reset_hunk<cr>")
nnoremap("ghp", "<cmd>Gitsigns preview_hunk_inline<cr>")
nnoremap("ghd", "<cmd>Gitsigns diffthis<cr>")
nnoremap("ghR", "<cmd>Gitsigns reset_buffer<cr>")
nnoremap("ghR", "<cmd>Gitsigns reset_buffer<cr>")
nnoremap("ghs", "<cmd>Gitsigns stage_hunk<cr>")
nnoremap("ghu", "<cmd>Gitsigns undo_stage_hunk<cr>")

-- Nvim-tree
nnoremap("nt", "<cmd>NvimTreeToggle<cr>")
