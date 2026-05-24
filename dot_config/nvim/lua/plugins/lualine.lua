return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-mini/mini.icons" },
  config = function()
    require("mini.icons").mock_nvim_web_devicons()
    require("lualine").setup({
      options = {
        theme = "catppuccin-nvim",
      },
    })
  end,
}
