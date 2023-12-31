return {
    "is0n/jaq-nvim",
    opts = {
        cmds = {
            external = {
                python = "python3 %",
                lua = "love .",
                rust = "cargo run",
            },
        },

        behavior = {
            default = "float",
            startinsert = false,
        },

        ui = {
            float = {
                border = "rounded",
                winhl = "Normal",
                borderhl = "FloatBorder",
                winblend = 0,
                height = 0.8,
                width = 0.8,
                x = 0.5,
                y = 0.5,
            },
        },
    },
    config = function(_, opts)
        require("jaq-nvim").setup(opts)
        vim.keymap.set("n", "<C-Enter>", ":Jaq<CR>")
    end,
}
