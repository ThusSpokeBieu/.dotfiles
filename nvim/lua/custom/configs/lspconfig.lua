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

lspconfig.omnisharp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "dotnet", "C:/Users/gmess/.omnisharp/OmniSharp.dll" },
  filetypes = { "cs", "vb" },
  enable_import_completion = true,
  enable_editorconfig_support = true,
  --enable_ms_build_load_projects_on_demand = false,
  enable_roslyn_analyzers = true,
  --organize_imports_on_format = true,
  sdk_include_prereleases = true,
  analyze_open_documents_only = false,
  omnisharp = {
    completeUnimported = true,
    usePlaceholders = true,
    analyses = {
      unusedparams = true,
    }
  }
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
