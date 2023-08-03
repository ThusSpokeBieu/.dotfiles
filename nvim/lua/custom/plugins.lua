local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "gofumpt",
        "golines",
        "goimports-reviser",
        "csharp-language-server",
        "csharpier",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "jdtls",
        "google-java-format",
        "java-debug-adapter",
        "java-test"
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "go", "cs" },
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  --{
  -- "mfussenegger/nvim-jdtls",
--
  --}
  --{
  --  #  "hrsh7th/nvim-cmp",
  --  opts = {
  --    sources = {
  --     { name = "nvim_lsp" },
  --      { name = "luasnip" },
  --      { name = "buffer" },
  --      { name = "nvim_lua" },
  --      { name = "path" },
  --      { name = "cmp_tabnine" },
  --    },
  --  },
--
  --  dependencies = {
  --    {
  --      "tzachar/cmp-tabnine",
  --      build = "powershell ./install.ps1",
   --     config = function()
  --      local tabnine = require "cmp_tabnine.config"
  --        tabnine:setup {} -- put your options here
  --      end,
  --    },
  --  },
--},
}

return plugins
