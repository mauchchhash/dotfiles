vim.cmd([[
nnoremap <leader>gs :Git<cr>
nnoremap <leader>gl :Git log<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gm :Git checkout master<cr>
nnoremap <leader>gb :Git branch<cr>
nnoremap <leader>gx :Git branch -d<space>
nnoremap <leader>gn :Git checkout -b<space>
nnoremap <leader>gc :Git checkout<space>
nnoremap <leader>gt :Git commit -m ""<left>
nnoremap <leader>ga :Git commit --amend<cr>
nnoremap <leader>gM :Git merge<space>
nnoremap <leader>g. :Git add .<cr>
nnoremap <leader>gp :Git push<cr>
]])

-- Fugitive auto commands (NOT WORKING!!!)
-- local map = vim.keymap.set
-- local api = vim.api
--
-- local ns_opts = { noremap = true, silent = true }
--
-- local fugitiveGroup = api.nvim_create_augroup("Fugitive", { clear = true })
-- api.nvim_create_autocmd("FileType", {
--     pattern = 'fugitive',
--     callback = function()
--         map("n", [[q]], ":q<cr>", ns_opts)
--     end,
--     group = fugitiveGroup,
-- })
