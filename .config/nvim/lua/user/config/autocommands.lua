local map = vim.keymap.set
local api = vim.api

local ns_opts = { noremap = true, silent = true }
local s_opts = { silent = true }


-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank()",
    group = yankGrp,
})


-- PHP file auto commands
local phpGroup = api.nvim_create_augroup("PHPFile", { clear = true })
api.nvim_create_autocmd("FileType", {
    pattern = 'php',
    callback = function()
        map("i", [[,>]], "<Esc>A =><space>", ns_opts)
    end,
    group = phpGroup,
})

-- Fugitive auto commands
local fugitiveGroup = api.nvim_create_augroup("Fugitive", { clear = true })
api.nvim_create_autocmd("FileType", {
    pattern = 'fugitive',
    callback = function()
        map("n", [[q]], ":q<cr>", ns_opts)
    end,
    group = fugitiveGroup,
})

vim.cmd([[ autocmd BufWritePre * lua vim.lsp.buf.format() ]])

-- api.nvim_create_autocmd("BufWritePost", {
--     pattern = '/home/*/.config/nvim/lua/user/config/autocommands.lua',
--     callback = function()
--        vim.cmd [[echo 'autocommands written']]
--     end,
-- })
