local status1, mason = pcall(require, "mason")
if not status1 then return end

local status2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status2 then return end

local status3, lspconfig = pcall(require, "lspconfig")
if not status3 then return end

local servers = {
    "jsonls",
    "sumneko_lua",
    'phpactor',
    'intelephense',
    -- 'eslint',
    'tsserver',
    'volar'
}

mason.setup()
mason_lspconfig.setup({
    automatic_installation = true,
    ensure_installed = servers,
})

for _, server in pairs(servers) do
    local opts = {
        on_attach = require("user.plugins.config.lsp.handlers").on_attach,
        capabilities = require("user.plugins.config.lsp.handlers").capabilities,
    }
    local has_custom_opts, server_custom_opts = pcall(require, "user.plugins.config.lsp.settings." .. server)
    if has_custom_opts then
        opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
    end
    lspconfig[server].setup(opts)
end
