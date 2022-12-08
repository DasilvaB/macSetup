local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- My keymaps
keymap("n", "<cr>", ":noh<cr>", opts) -- After searching text with '\' you can press enter to get rid of highlight
keymap("n", "<leader>p", "\"_dP", opts) -- Delete copys things into register, so using leader p will ensure the deletd text does not replace whats currently copied
keymap("n", "<leader>o", "o<Esc>", opts) -- Adds new line without going into insert mode

-- Lsp
-- Lsp keymaps can be found in file cmp.lua

-- Nvim-tree
keymap("n", "<space>e", ":NvimTreeToggle<cr>", opts)

-- Trouble (nvim trouble)
keymap("n", "<leader>xx", ":TroubleToggle<cr>",opts)
keymap("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<cr>",opts)
keymap("n", "<leader>xd", ":TroubleToggle document_diagnostics<cr>",opts)
keymap("n", "<leader>xq", ":TroubleToggle quickfix<cr>",opts)
keymap("n", "<leader>xl", ":TroubleToggle loclist<cr>",opts)
keymap("n", "<leader>gR", ":TroubleToggle lsp_references<cr>",opts)

-- Harpoon 
keymap("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<leader>hm", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap("n", "<leader>hn", ":lua require('harpoon.ui').nav_next()<CR>", opts)
keymap("n", "<leader>hp", ":lua require('harpoon.ui').nav_prev()<CR>", opts)
keymap("n", "<leader>hf", ":lua require('harpoon.ui').nav_file(", opts)

-- Telescope
keymap("n", "<leader>tf", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>tl", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>tg", ":Telescope grep_string<cr>", opts)
keymap("n", "<leader>tb", ":Telescope buffers<cr>", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Quickfix window
keymap("n", "<leader>cn", ":cnext<CR>", opts)
keymap("n", "<leader>cp", ":cprev<CR>", opts)
keymap("n", "<leader>cc", ":cc", opts)
keymap("n", "<leader>cl", ":cclose<CR>", opts)
keymap("n", "<leader>co", ":copen<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
