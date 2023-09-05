return {
  "catppuccin/nvim",
  config = function ()
    vim.cmd("colorscheme catppuccin")
    vim.o.termguicolors = true   
  end,
  priority = 100
}
