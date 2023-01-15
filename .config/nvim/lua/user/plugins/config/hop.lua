local status_ok, hop = pcall(require, "hop")
if not status_ok then
    return
end

hop.setup()

local directions = require('hop.hint').HintDirection

vim.keymap.set('n', '<leader><leader>w', function()
    hop.hint_words({ direction = directions.AFTER_CURSOR })
end, { remap = true, silent = true })

vim.keymap.set('n', '<leader><leader>b', function()
    hop.hint_words({ direction = directions.BEFORE_CURSOR })
end, { remap = true, silent = true })

vim.keymap.set('n', '<leader><leader>e', function()
    hop.hint_anywhere()
end, { remap = true, silent = true })


-- vim.keymap.set('', 'f', function()
--     hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
-- end, { remap = true })
-- vim.keymap.set('', 'F', function()
--     hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
-- end, { remap = true })
-- vim.keymap.set('', 't', function()
--     hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
-- end, { remap = true })
-- vim.keymap.set('', 'T', function()
--     hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
-- end, { remap = true })
