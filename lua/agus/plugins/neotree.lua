return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function ()
    require("neo-tree").setup({
      window = {
        position = "current"
      },
      hijack_netrw_behavior = "open_current",
    })
    vim.keymap.set("n", "<leader>pv", vim.cmd.Neotree)
  end,
}
