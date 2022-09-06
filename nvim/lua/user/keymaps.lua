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

-- Lsp
-- Lsp keymaps can be found in file cmp.lua

-- Nvim-tree
keymap("n", "<space>e", ":NvimTreeToggle<cr>", opts)

-- Harpoon 
keymap("n", "<space>a", ":lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<space>m", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap("n", "<space>n", ":lua require('harpoon.ui').nav_next()<CR>", opts)
keymap("n", "<space>p", ":lua require('harpoon.ui').nav_prev()<CR>", opts)
keymap("n", "<space>f", ":lua require('harpoon.ui').nav_file(", opts)

-- Telescope
keymap("n", "tf", ":Telescope find_files<cr>", opts)
keymap("n", "tl", ":Telescope live_grep<cr>", opts)
keymap("n", "tg", ":Telescope grep_string<cr>", opts)
keymap("n", "tb", ":Telescope buffers<cr>", opts)

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
keymap("n", "cn", ":cnext<CR>", opts)
keymap("n", "cp", ":cprev<CR>", opts)
keymap("n", "cc", ":cc", opts)
keymap("n", "cl", ":cclose<CR>", opts)
keymap("n", "co", ":copen<CR>", opts)

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
