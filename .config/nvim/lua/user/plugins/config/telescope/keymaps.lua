-- Key,mappings
local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
    return
end

local ns_opts = { noremap = true, silent = true }
local map = vim.keymap.set

map('n', '<space>ff', builtin.find_files, ns_opts)
map('n', '<space>fF', function() builtin.find_files({ no_ignore = true }) end, ns_opts)
map('n', '<space>fb', function() builtin.buffers({ ignore_current_buffer = true, sort_mru = true }) end, ns_opts)
map('n', '<space>fg', builtin.live_grep, ns_opts)
map('n', '<space>fh', builtin.help_tags, ns_opts)
map('n', '<space>fc', builtin.commands, ns_opts)
-- map('n', '<space>fq', builtin.quickfix, ns_opts)
map('n', '<space>fd', builtin.diagnostics, ns_opts)
map('n', '<space>fs', builtin.spell_suggest, ns_opts)

-- Duplicate find_files mapping for ctrl-p key
-- map('n', '<c-p>', builtin.find_files, ns_opts)
