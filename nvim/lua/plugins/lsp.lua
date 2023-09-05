return {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip'
  },
  opts = {
    sources = {
      { name = "nvim_lsp" },
      { name = "crates "}
    },
    experimental = {
      ghost_text = true
    }
  },
  config = function (opts)
    local lsp = require('lsp-zero').preset("recommended")

    lsp.on_attach(function (_, bufnr)
      vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      lsp.default_keymaps({ buffer = bufnr })
    end)

    local cmp = require("cmp")
    cmp.setup(opts)
    lsp.setup()
  end
}
