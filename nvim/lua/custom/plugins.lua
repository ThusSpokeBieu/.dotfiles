local plugins = {

  -- this opts will extend the default opts 
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults 
        "vim",
  "lua",
        "sql",

        -- web dev 
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "scss",
        "prisma",
        "yaml",
        "markdown",
        -- "vue", "svelte",
        
        -- docker
  "Dockerfile",

        -- low level
        "c",
        "zig",

        -- main
        "java",
        "c_sharp",
        "go",
        "gosum",
        "gomod",
        "proto"
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "html-lsp",
        "prettier",
        "stylua",

        -- go 
        "gopls",
        "gofumpt",
        "goimports-reviser",
        "golines",
        "gomodifytags",
        "buf-language-server",

        -- .net 
        "omnisharp",
        "csharpier",
        "netcoredbg",

        -- java
        "jdtls",
        "google-java-format",
        "java-debug-adapter",

        -- tss
        "deno",
        "typescript-language-server",
        "prisma-language-server",
        "angular-language-server",

        -- sql
        "sqlfmt",
        "sqlls",

        -- docker
        "docker-compose-language-service",
        "dockerfile-language-server",

        -- yaml 
        "yaml-language-server",
        "yamlfmt",
      },
      lazy = false,
    },
  },

  -- In order to modify the `lspconfig` configuration:
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      ft = { "go", "cs", "java" },
      config = function()
        require "custom.configs.null-ls"
      end,

    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end,
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


}

return plugins

