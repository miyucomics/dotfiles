return {
  "nvim-treesitter/nvim-treesitter",
  opts = function ()
    return {
      ensure_installed = {
        "lua",
        "python",
        "rust",
        "typescript"
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true
      }
    }
  end
}
