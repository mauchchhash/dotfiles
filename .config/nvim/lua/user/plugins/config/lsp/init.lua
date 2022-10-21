local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.plugins.config.lsp.configs"
require("user.plugins.config.lsp.handlers").setup()
