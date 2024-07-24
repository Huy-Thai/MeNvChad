return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",
      setup = {
      ensure_installed = {
        "lua_ls",
        "stylelint_lsp",
        "html",
        "cssls",
        "svelte",
        "graphql",
        "rust_analyzer",
        "eslint",
        "emmet_ls",
        "tailwindcss",
        "tsserver",
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
      setup = {
      ensure_installed = {
        "prettier",
        "stylua",
        "eslint_d",
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
     config = function()
       require("nvchad.configs.lspconfig").defaults()
       require "configs.lspconfig"
     end,
  },
  {
   	"nvim-treesitter/nvim-treesitter",
    opts = {
    ensure_installed = {
   		"vim",
      "lua",
      "vimdoc",
      "html",
      "css",
      "rust",
      "javascript",
      "typescript",
      "tsx",
   	}},
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  }
}
