local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    renderer = {
        root_folder_modifier = ":t",
        indent_markers = {
            enable = true
        }

    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
    view = {
        width = 30,
        side = "left",
        mappings = {
            list = {
                { key = "x", cb = tree_cb "close_node" },
                { key = "X", cb = tree_cb "cut" },
            },
        },
    },
    git = {
        ignore = false
    }
}

-- key mappings
-- Key,mappings
local ns_opts = { noremap = true, silent = true }
local map = vim.keymap.set


map('n', '<C-n>', ":NvimTreeToggle<cr>", ns_opts)
map('n', '<leader>N', ":NvimTreeFindFile<cr>", ns_opts)
