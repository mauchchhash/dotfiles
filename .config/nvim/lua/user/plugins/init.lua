local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end


-- Autocommand that reloads neovim whenever plugins/init.lua file is saved
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost */plugins/init.lua source <afile> | PackerSync --preview
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("couldn't resolve packer.nvim.", vim.log.levels.ERROR)
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install plugins
return packer.startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use 'kana/vim-textobj-user'
    -- use 'kana/vim-textobj-indent'
    use 'kana/vim-textobj-entire'
    use 'kana/vim-textobj-line'
    use 'michaeljsmith/vim-indent-object'

    use "nvim-lua/plenary.nvim"
    use "tpope/vim-surround"
    use "tpope/vim-repeat"
    use "FooSoft/vim-argwrap"
    use({ "akinsho/toggleterm.nvim", config = "require('user.plugins.config.toggleterm')" })
    -- use { "karb94/neoscroll.nvim", config = "require('user.plugins.config.neoscroll')" }

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = "require('user.plugins.config.treesitter')" }
    ---- use { "JoosepAlviste/nvim-ts-context-commentstring", after = 'nvim-treesitter' }
    use { "numToStr/Comment.nvim", after = "nvim-treesitter", config = "require('user.plugins.config.comment')" }

    use { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' }

    use { "windwp/nvim-autopairs", config = "require('user.plugins.config.autopairs')" }
    use { "windwp/nvim-ts-autotag", wants = "nvim-treesitter", event = "InsertEnter",
        config = function() require("nvim-ts-autotag").setup { enable = true } end }
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { { 'nvim-lua/plenary.nvim' } },
        config = "require('user.plugins.config.telescope')" }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons', }, tag = 'nightly',
        config = "require('user.plugins.config.nvim-tree')" }
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = "require('user.plugins.config.lualine')" }
    use { 'inkarkat/vim-ReplaceWithRegister' }
    use { 'folke/tokyonight.nvim', config = "require('user.plugins.config.colorschemes.tokyonight')" }
    use({ "L3MON4D3/LuaSnip" }) --snippet engine
    use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

    -- cmp plugins
    use({ "hrsh7th/nvim-cmp",
        requires = { "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-nvim-lsp" },
        config = "require('user.plugins.config.nvim-cmp')" })

    -- lsp plugins
    use { "williamboman/mason.nvim", after = "telescope.nvim" } -- lsp servers installers
    use { "williamboman/mason-lspconfig.nvim", after = "mason.nvim" } -- needed for mason.nvim to work with nvim-lspconfig
    use({ "glepnir/lspsaga.nvim", branch = "main", config = "require('user.plugins.config.lsp.lspsaga')" })
    use { "neovim/nvim-lspconfig", after = { "mason-lspconfig.nvim", "lspsaga.nvim" },
        config = "require( 'user.plugins.config.lsp' )" }
    use { "jose-elias-alvarez/null-ls.nvim", after = "nvim-lspconfig",
        config = "require( 'user.plugins.config.lsp.null-ls' )" }
    use { "ray-x/lsp_signature.nvim", after = "nvim-lspconfig", config = "require 'lsp_signature'.setup()" }
    use { 'weilbith/nvim-code-action-menu', config = "require('user.plugins.config.code-action-menu')" }
    use { 'j-hui/fidget.nvim', config = "require'fidget'.setup{}" }
    use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons",
        config = "require('user.plugins.config.trouble')" }

    use { 'simrat39/symbols-outline.nvim', config = "require('user.plugins.config.symbols-outline')" }

    use { "kdheepak/lazygit.nvim", config = "require('user.plugins.config.lazygit')" }
    use { "tpope/vim-fugitive", config = "require('user.plugins.config.fugitive')" }
    use { "lewis6991/gitsigns.nvim", config = "require('user.plugins.config.gitsigns')" }
    use { 'phaazon/hop.nvim', branch = 'v2', config = "require('user.plugins.config.hop')" }
    use { 'ggandor/leap.nvim', config = "require('leap').add_default_mappings()" }
    --
    use { 'lukas-reineke/indent-blankline.nvim', config = "require('user.plugins.config.indent-blankline')" }
    use { 'tpope/vim-unimpaired' }
    use { 'AndrewRadev/sideways.vim' }
    use { 'jeetsukumaran/vim-indentwise' }
    use { 'ctrlpvim/ctrlp.vim', config = "require('user.plugins.config.ctrlp')" }
    use { 'jwalton512/vim-blade' }

    -- Automatically set up configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        packer.sync()
    end
end)
