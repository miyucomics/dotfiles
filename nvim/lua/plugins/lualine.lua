return {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            icons_enabled = true,
            theme = "catppuccin",
            disabled_filetypes = {
                "alpha",
                "TelescopePrompt",
            },
        },
        sections = {
            lualine_x = { "filetype" },
        },
    },
}
