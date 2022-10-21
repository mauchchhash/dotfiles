local map = vim.keymap.set
-- local e_opts = { expr = true }
-- local s_opts = { silent = true }
local n_opts = { noremap = true, silent = false }
local ns_opts = { noremap = true, silent = true }
-- local se_opts = { silent = true, expr = true }

-- Map leader
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Save fle
map("i", "<Leader>w", "<Esc>:w<cr>", ns_opts)
map("n", "<Leader>w", ":w<cr>", ns_opts)


-- Quit fle
map("n", "<Leader>q", "<Esc>:q<cr>", ns_opts)

-- Remove highlight
map("n", "<Leader>n", "<cmd>nohl<CR>", n_opts)

-- Swap ' & `
map("n", "'", "`", ns_opts)
map("n", "`", "'", ns_opts)

-- map("n", "<F2>", [[:%s/\<<C-r><C-w>\>/]])

-- Window switching
map("n", "<C-h>", "<C-w>h", ns_opts)
map("n", "<C-l>", "<C-w>l", ns_opts)
map("n", "<C-k>", "<C-w>k", ns_opts)
map("n", "<C-j>", "<C-w>j", ns_opts)

-- Navigate buffers
map("n", ")", ":bnext<CR>", ns_opts)
map("n", "(", ":bprevious<CR>", ns_opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", ns_opts)
map("n", "<C-Down>", ":resize +2<CR>", ns_opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", ns_opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", ns_opts)

-- Stay in indent mode
-- map("v", "<", "<gv", ns_opts)
-- map("v", ">", ">gv", ns_opts)

-- Command mode movement
map("c", "<C-h>", "<Left>")
map("c", "<C-l>", "<Right>")

-- Duplicate line
map("n", "<A-d>", ":t.<CR>", ns_opts)
map("i", "<A-d>", "<Esc>:t.<CR>gi", ns_opts)

-- Move line / block
map("n", "<A-,>", ":m .-2<CR>==", ns_opts)
map("v", "<A-,>", ":m '<-2<CR>gv-gv", ns_opts)
map("v", "<A-.>", ":m '>+1<CR>gv-gv", ns_opts)
map("n", "<A-.>", ":m .+1<CR>==", ns_opts)

-- Enter normal mode in terminal
-- map("t", "<Esc>", "<C-\\><C-n>", ns_opts)
map("t", "<Esc>", [[<C-\><C-n>]], ns_opts)

-- Center cursor after traversing search
-- map("n", "n", "nzz", ns_opts)
-- map("n", "N", "Nzz", ns_opts)

map("i", "<C-l>", "<Esc>A", ns_opts)
map("i", ";w", "<Esc>A;<Esc>:w<cr>", ns_opts)
map("i", ",,", "<Esc>A,", ns_opts)
-- map("i", [[,>]], "<Esc>A =><space>", ns_opts)

vim.api.nvim_set_keymap("n", "<leader>ff", '<cmd>lua vim.lsp.buf.format()<CR>', ns_opts)
-- vim.api.nvim_set_keymap("n", "<leader>ff", '<cmd>lua vim.lsp.buf.formatting_sync()<CR>', ns_opts)
