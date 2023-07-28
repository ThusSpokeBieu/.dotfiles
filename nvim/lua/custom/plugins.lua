local plugins = {
   {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
          "lua-language-server",
          "html-lsp",
          "prettier",
          "stylua",
          "csharpier",
          "omnisharp"
      },
    },
  },
  {
     "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "c",
        "zig",
        "go",
        "c_sharp",
        "java",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}

return plugins
