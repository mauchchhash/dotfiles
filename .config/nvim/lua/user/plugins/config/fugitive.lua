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
