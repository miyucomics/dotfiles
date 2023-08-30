local lsp = require('lsp-zero').preset("recommended")

lsp.on_attach(function (_, bufnr)
	vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, {})
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	lsp.default_keymaps({ buffer = bufnr })
end)

require("neodev").setup({})

local cmp = require("cmp")
cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "crates" }
  }
})

lsp.setup()
