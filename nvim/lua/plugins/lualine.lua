return {
  "nvim-lualine/lualine.nvim",
  opts = function ()
    return {
      options = {
        icons_enabled = true,
        theme = "catppuccin"
      },
      sections = {
        lualine_x = {'filetype'}
      }
    }
  end
}
