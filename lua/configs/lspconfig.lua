local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local mason_lspconfig = require("mason-lspconfig")
local util = require "lspconfig/util"
local servers = { "svelte", "tsserver", "tailwindcss", "eslint", "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  mason_lspconfig.setup_handlers({
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
  })
end

-- rust
mason_lspconfig.setup_handlers({
lspconfig.svelte.setup({
  capabilities = capabilities,
  on_attach = function(client, _)
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.js", "*.ts" },
      callback = function(ctx)
      -- Here use ctx.match instead of ctx.file
        client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
        end,
    })
  end,
}),
lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ['rust_analyzer'] = {
      cargo = { allFeatures = true },
    },
  },
}),
lspconfig.emmet_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
    filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
  })
})
