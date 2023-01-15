local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
    return
end

trouble.setup()

vim.keymap.set('n', '<leader>tt', "<cmd>TroubleToggle<cr>", { noremap = true, silent = true })
