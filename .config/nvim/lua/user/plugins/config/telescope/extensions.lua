local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

-- Extenstions
telescope.load_extension('fzf')
