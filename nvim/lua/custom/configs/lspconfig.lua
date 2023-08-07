local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities
 
local lspconfig = require "lspconfig"
local servers = { 
  
  -- go
  "gopls",
  "bufls",
  
  -- .net
  "omnisharp",

  -- java
  "jdtls",

  -- ts 
  "denols",
  "tsserver",
  "prismals",
  "angularls",

  -- utils
  "yaml-language-server", 
  "sqlls",
  "docker_compose_language_service",
  "dockerls",
  "yamlls"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.omnisharp.setup{
  cmd = { "C:\\Users\\gmess\\.omnisharp\\OmniSharp.exe" },
  filetypes = { "cs", "vb" },
  enable_editorconfig_support = true,
  enable_roslyn_analyzers = true,
  organize_imports_on_format = false,
  enable_import_completion = true,
  sdk_include_prereleases = true,
  analyze_open_documents_only = false,
}
