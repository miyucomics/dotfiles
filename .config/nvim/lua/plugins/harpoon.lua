return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<c-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		for i = 1, 9 do
			vim.keymap.set("n", "<a-" .. tostring(i) .. ">", function()
				harpoon:list():select(i)
			end)
		end
	end,
}
