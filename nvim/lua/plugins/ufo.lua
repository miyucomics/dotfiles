return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    opts = {
        open_fold_hl_timeout = 0,
    },
    config = function(_, opts)
        require("ufo").setup(opts)
        vim.o.foldenable = true
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
    end,
}
