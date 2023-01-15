require("symbols-outline").setup()

vim.keymap.set('n', 'go', "<cmd>SymbolsOutline<cr>", { noremap = true, silent = true })
