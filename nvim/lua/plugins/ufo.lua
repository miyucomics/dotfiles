return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    opts = {
        open_fold_hl_timeout = 0,
    },
    config = function(opts)
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }

        local language_servers = require("lspconfig").util.available_servers()
        for _, ls in ipairs(language_servers) do
            require("lspconfig")[ls].setup({
                capabilities = capabilities,
            })
        end
        require("ufo").setup(opts)

        vim.o.foldenable = true
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
    end,
}
