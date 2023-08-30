local plugins = {
	{
    "catppuccin/nvim",
    priority = 100
  },
  "nvim-tree/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
	"nvim-treesitter/nvim-treesitter",
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      fast_wrap = {},
      disable_filetype = {"TelescopePrompt", "vim"}
    },
    config = function (_, opts)
      require("nvim-autopairs").setup(opts)
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
  },
  "numToStr/Comment.nvim",
  "lukas-reineke/indent-blankline.nvim",
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" }
  },
	"stevearc/oil.nvim",
	"NvChad/nvterm",
	{
    "folke/neodev.nvim",
    ft = "lua"
  },
	{
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
      experimental = {
        ghost_text = true
      }
    },
    config = function (_, opt)
      require("cmp").setup(opt)
    end
	},
  {
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	{
		"ggandor/leap.nvim",
		config = function ()
			require("leap").add_default_mappings()
		end
	},

  -- Rust stuff
  {
    "simrat39/rust-tools.nvim",
    ft = "rust"
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function (_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end
  }
}

require("lazy").setup(plugins, require("plugins.config.lazy"))
