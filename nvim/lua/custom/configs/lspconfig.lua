local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

lspconfig.csharp_ls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.docker_compose_language_service.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.dockerls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "docker-langserver", "--stdio" },
  filetypes = { "dockerfile" },
}

lspconfig.jdtls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  -- cmd = {
  --  "jdtls",
  --  "-configuration",
  --  "C:/Users/gmess/.jdtls/config_win/",
  --  "-data",
  --  "C:/Users/gmess/.jdtls/bin"
  --},
  filetypes = { "java" },
}
