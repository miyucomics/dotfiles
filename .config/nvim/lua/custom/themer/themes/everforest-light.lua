-- Credits to original https://github.com/sainnhe/everforest
-- This is modified version of it

local M = {}

M.base_30 = {
	white = "#272f35",
	darker_black = "#f5efde",
	black = "#fff9e8",
	black2 = "#F0EAD9",
	one_bg = "#E0DAC9",
	one_bg2 = "#D1CBBA",
	one_bg3 = "#C2BCAB",
	grey = "#B3AD9C",
	grey_fg = "#A39D8C",
	grey_fg2 = "#948E7D",
	light_grey = "#857F6E",
	red = "#c85552",
	pink = "#ef6590",
	line = "#e8e2d1",
	green = "#5da111",
	blue = "#3a94c5",
	yellow = "#dfa000",
	purple = "#b67996",
	teal = "#69a59d",
	orange = "#F7954F",
	cyan = "#89bfdc",
	statusline_bg = "#ede7d6",
	pmenu_bg = "#5f9b93",
	folder_bg = "#747b6e",
}

M.base_16 = {
	base00 = "#fff9e8",
	base01 = "#f6f0df",
	base02 = "#ede7d6",
	base03 = "#e5dfce",
	base04 = "#ddd7c6",
	base05 = "#495157",
	base06 = "#3b4349",
	base07 = "#272f35",
	base08 = "#5f9b93",
	base09 = "#b67996",
	base0A = "#8da101",
	base0B = "#d59600",
	base0C = "#ef615e",
	base0D = "#87a060",
	base0E = "#c85552",
	base0F = "#c85552",
}

M.polish_hl = {
	DiffAdd = { fg = M.base_30.green },
	NvimTreeFolderName = { fg = "#4e565c" },
	Pmenu = { bg = M.base_30.black2 },
	["@tag"] = { fg = M.base_30.orange },
	["@variable.member"] = { fg = M.base_16.base05 },
	["@keyword.import"] = { fg = M.base_16.base08 },
	["@constructor"] = { fg = M.base_30.blue },
}

M.type = "light"

return M