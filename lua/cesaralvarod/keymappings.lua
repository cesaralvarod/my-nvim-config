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

nnoremap("<C-c>", ":sp term://fish<CR>")
nnoremap("<C-z>", ":vsp term://fish<CR>")

-- 11. Nvim Tree

nnoremap("nt", "<Cmd>NvimTreeToggle<CR>")

-- 12. Bufferline

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

-- 14. Alternate Toggler

nnoremap("<leader><space>", "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>")

-- 15. Bookmarks

nnoremap("ma", "<cmd>lua require('telescope').extensions.vim_bookmarks.all()<CR>")

-- 16.TodoTelescope

nnoremap("<leader><tab>", "<cmd>TodoTelescope<CR>")

-- 17. Undotree

nnoremap("<leader>u", "<cmd>UndotreeToggle<cr>")

-- 18. Hop

nnoremap("ff", "<cmd>HopPattern<cr>")
nnoremap("fw", "<cmd>HopWord<cr>")
nnoremap("fv", "<cmd>HopVertical<cr>")

-- 19. Color picker

inoremap("<C-c>", "<cmd>PickColorInsert<cr>")

-- 20. telescope

nnoremap(
	"<leader>b",
	"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>"
)
nnoremap(
	"<leader>f",
	"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>"
)
nnoremap("<leader>sf", "<cmd>Telescope file_browser<cr>")
nnoremap("<leader>F", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>G", "<cmd>Telescope current_buffer_fuzzy_find<cr>")

nnoremap("<leader>sc", "<cmd>Telescope colorscheme<cr>")
nnoremap("<leader>sh", "<cmd>Telescope help_tags<cr>")
nnoremap("<leader>sM", "<cmd>Telescope man_pages<cr>")
nnoremap("<leader>sr", "<cmd>Telescope oldfiles<cr>")
nnoremap("<leader>sR", "<cmd>Telescope registers<cr>")
nnoremap("<leader>sk", "<cmd>Telescope keymaps<cr>")
nnoremap("<leader>sC", "<cmd>Telescope commands<cr>")

nnoremap("<leader>sb", "<cmd>Telescope git_branches<cr>")
nnoremap("<leader>sgc", "<cmd>Telescope git_commits<cr>")
nnoremap("<leader>sgs", "<cmd>Telescope git_status<cr>")

nnoremap("<leader>fd", "<cmd>Telescope docker containers<cr>")
nnoremap("<leader>fi", "<cmd>Telescope docker images<cr>")
nnoremap("<leader>fcc", "<cmd>Telescope docker compose<cr>")

-- 21. codi

nnoremap("<leader>x", "<cmd>Codi<cr>")

-- 22. Packer

nnoremap("<leader>pi", "<cmd>PackerInstall<cr>")
nnoremap("<leader>ps", "<cmd>PackerSync<cr>")
nnoremap("<leader>pS", "<cmd>PackerStatus<cr>")
nnoremap("<leader>pu", "<cmd>PackerUpdate<cr>")

-- 23. Spectre

nnoremap("<leader>S", "<cmd>lua require('spectre').open()<cr>")
nnoremap("<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>")
vnoremap("<leader>sw", "<cmd>lua require('spectre').open_visual()<cr>")

nnoremap("<leader>sp", "<cmd>lua require('spectre').open_file_search()<cr>")

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

-- 25. Icon picker

nnoremap("<leader><leader>i", "<cmd>IconPickerNormal<cr>")

-- 26. Searchbox

nnoremap("<leader>s", "<cmd>SearchBoxSimple<cr>")
nnoremap("<leader>sr", "<cmd>SearchBoxReplace<cr>")
