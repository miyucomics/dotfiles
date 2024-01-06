return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"lua",
			"python",
			"rust",
		},
		sync_install = false,
		auto_install = false,
		highlight = {
			enable = true,
		},
	},
}
