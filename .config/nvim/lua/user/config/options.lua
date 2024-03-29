local options = {
    background = "dark", -- set term gui colors (most terminals support this)
    termguicolors = true, -- set term gui colors (most terminals support this)

    -- backup = false, -- creates a backup file
    -- clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    -- cmdheight = 2, -- more space in the neovim command line for displaying messages
    -- completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    -- conceallevel = 0, -- so that `` is visible in markdown files
    fileencoding = "utf-8", -- the encoding written to a file
    hlsearch = true, -- highlight all matches on previous search pattern
    incsearch = true, -- Searches for strings incrementally
    ignorecase = true, -- ignore case in search patterns
    mouse = "a", -- allow the mouse to be used in neovim
    -- pumheight = 10, -- pop up menu height
    -- showmode = false, -- we don't need to see things like -- INSERT -- anymore
    -- showtabline = 2, -- always show tabs
    smartcase = true, -- smart case
    autoindent = true, -- auto indent new lines
    smartindent = true, -- make indenting smarter again
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- creates a swapfile
    -- timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
    -- undofile = true, -- enable persistent undo
    -- updatetime = 100, -- faster completion (4000ms default)
    -- writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    tabstop = 4, -- insert 4 spaces for a tab
    cursorline = true, -- highlight the current line
    number = true, -- set numbered lines
    relativenumber = true, -- set relative numbered lines
    numberwidth = 4, -- set number column width to 2 {default 4}
    -- autowrite = true, -- save on buffer switch
    nrformats = 'alpha', -- alpha base for number increasing and decreasing
    -- signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    wrap = true, -- display lines as one long line
    -- scrolloff = 8, -- distance in lines from cursor to top/bottom
    -- sidescrolloff = 8,
    -- guifont = "monospace:h17", -- the font used in graphical neovim applications
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
