-- General keymaps that are not pluggin dependant
-- The file /lua/lsp/utils.lua contains lsp-specific commands

local Utils = require("cesaralvarod.utils")

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

-- execute python code

nnoremap("<leader>p", "^vg_y:!python -c '<C-R>\"'<CR>")
vnoremap("<leader>p", "^vg_y:!python -c '<C-R>\"'<CR>")

-- 1. Save documents

nnoremap("<leader>w", ":w<CR>") -- Save document with Space+w / Normal Mode
nnoremap("<leader>wa", ":wa<CR>") -- Save all documents with Space+w+a / Normal Mode
inoremap("<c-s>", "<c-o>:w<CR>") -- Save document with Ctrl+s / Insert Mode
nnoremap("<c-s>", ":w<CR>") -- Save document with Ctrl+s / Normal Mode
inoremap("<c-a>", "<c-o>:wa<CR>") -- Save all documents with Ctrl+a / Insert Mode
nnoremap("<c-a>", ":wa<CR>") -- Save all documents with Ctrl+a / Normal Mode

nnoremap("<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>") -- Format buffer

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "",
	callback = function()
		vim.lsp.buf.format()
	end,
})

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

-- 7. increment/decrement numbers

nnoremap("<leader>+", "<C-a>") -- increment numbers
nnoremap("<leader>-", "<C-x>") -- decrement numbers

-- 8. Replace word fast

nnoremap(";a", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
nnoremap(";s", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left><Left>]])

-- 9. Move with cursor in the middle
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- 10. Buffers

nnoremap("<leader>k", ":bnext<CR>") -- Next buffer
nnoremap("<leader>j", ":bprevious<CR>") -- Previous buffer
nnoremap("<leader>0", ":bdelete<CR>") -- Delete buffer

-- 11. Yank to end of line

nnoremap("Y", "$")

-- 12. Splits

nnoremap("<leader>sh", ":split<CR>") -- split window horizontally
nnoremap("<leader>sv", ":vsplit<CR>") -- split window vertically
nnoremap("<leader>se", ":<C-w>=<CR>") -- make splits equal size width & height
nnoremap("<leader>sx", "<cmd>close<CR>") -- close current split window
nnoremap("<leader>s-", "<C-w>5-<CR>") -- resize window
nnoremap("<leader>s+", "<C-w>5-<CR>") -- resize window

-- 13. Tabs

nnoremap("<leader>to", "<cmd>tabnew<CR>") -- open new tab
nnoremap("<leader>tx", "<cmd>tabclose<CR>") -- close tab
nnoremap("<leader>tn", "<cmd>tabn<CR>") -- go to next tab
nnoremap("<leader>tp", "<cmd>tabp<CR>") -- go to prev tab
nnoremap("<leader>tf", "<cmd>tabnew %<CR>") -- open current buffer in new tab

-- 14. Terminal

nnoremap("<A-x>", ":sp term://fish<CR>")
nnoremap("<A-z>", ":vsp term://fish<CR>")

-- 15. Bufferline

-- Picking
nnoremap("<A-o>", "<Cmd>BufferLinePick<CR>")
nnoremap("<A-c>", "<Cmd>BufferLinePickClose<CR>")

-- Pin
nnoremap("<A-p>", "<Cmd>BufferLineTogglePin<CR>")

-- Move to previous/next
nnoremap("<A-b>", "<Cmd>BufferLineCyclePrev<CR>")
nnoremap("<A-w>", "<Cmd>BufferLineCycleNext<CR>")

-- Re-order to previous/next
nnoremap("<A-,>", "<Cmd>BufferLineMovePrev<CR>")
nnoremap("<A-.>", "<Cmd>BufferLineMoveNext<CR>")

-- Goto buffer in position...
for i = 1, 9 do
	nnoremap(("<A-%s>"):format(i), ("<Cmd>BufferLineGoToBuffer %s<CR>"):format(i))
end

-- 16. LSP and diagnostics

nnoremap("<leader>h", "<Cmd>:lua vim.lsp.buf.hover()<CR>")
nnoremap("<space>K", "<Cmd>:lua vim.lsp.buf.signature_help()<CR>")
nnoremap("gd", "<Cmd>:lua vim.lsp.buf.definition()<CR>")
nnoremap("gi", "<Cmd>:lua vim.lsp.buf.implementation()<CR>")
nnoremap("gr", "<Cmd>:lua vim.lsp.buf.references()<CR>")
nnoremap("gD", "<Cmd>:lua vim.lsp.buf.declaration()<CR>")

nnoremap("gt", "<Cmd>:lua vim.lsp.buf.type_definition()<CR>")
nnoremap("gR", "<Cmd>:lua vim.lsp.buf.rename()<CR>")
nnoremap("gq", "<Cmd>:lua vim.lsp.buf.code_action()<CR>")
nnoremap("<C-f>", "<Cmd>:lua vim.lsp.buf.format({async=true})<CR>")
nnoremap("<leader>e", "<Cmd>:lua vim.diagnostic.open_float()<CR>")

nnoremap("<leader>vp", "<Cmd>:lua vim.diagnostic.goto_prev()<CR>")
nnoremap("<leader>vn", "<Cmd>:lua vim.diagnostic.goto_next()<CR>")

-- 17.TodoTelescope

nnoremap("<leader><tab>", "<cmd>TodoTelescope<CR>")

-- 18. Nvim-tree
nnoremap("nt", "<cmd>NvimTreeToggle<cr>")

-- 19. DAP

nnoremap("<leader>db", "<cmd>:lua require('dap').toggle_breakpoint()<CR>") -- add breakpoint at line
nnoremap("<leader>dr", "<cmd>:lua require('dap').continue()<CR>") -- start or continue the debugger
nnoremap("<leader>dt", "<cmd>:lua require('dapui').toggle()<CR>") -- start or continue the debugger

nnoremap("<leader>dpr", "<cmd>:lua require('dap-python').test_method()<CR>") -- python dap
