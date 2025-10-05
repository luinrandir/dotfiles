return {
  {
    "mason-org/mason.nvim",
    opts = {
      registries = {
        'github:nvim-java/mason-registry',
        'github:mason-org/mason-registry',
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
      },
    },
  },
}
