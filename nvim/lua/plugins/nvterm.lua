return {
    "NvChad/nvterm",
    config = function()
        require("nvterm").setup()
        local terminal = require("nvterm.terminal")
        vim.keymap.set("n", "<leader>th", function()
            terminal.new("horizontal")
        end)
        vim.keymap.set("n", "<leader>tv", function()
            terminal.new("vertical")
        end)
        vim.keymap.set("n", "<leader>tf", function()
            terminal.toggle("float")
        end)
        vim.keymap.set("t", "<C-space>", "<C-\\><C-n>", { silent = true })
    end,
}
