local lspsaga_status_ok, saga = pcall(require, "lspsaga")
if not lspsaga_status_ok then
    return
end
local keymap = vim.keymap.set

local nsopts = { noremap = true, silent = true }

saga.init_lsp_saga()

-- keymap("n", "<space>gr", "<cmd>Lspsaga rename<CR>", nsopts)
keymap("n", "gs", "<cmd>Lspsaga lsp_finder<CR>", nsopts)
-- keymap("n", "ga", "<cmd>Lspsaga code_action<CR>", nsopts)
keymap("n", "]d", '<cmd>Lspsaga diagnostic_jump_next<CR>', nsopts)
keymap("n", "[d", '<cmd>Lspsaga diagnostic_jump_prev<CR>', nsopts)
