return {
    "numToStr/Comment.nvim",
    event = "BufReadPre",
    config = function()
        vim.keymap.set("n", "<leader>/", function()
            require("Comment.api").toggle.linewise.current()
        end)
        vim.keymap.set("v", "<leader>/", ':lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')
    end,
}
