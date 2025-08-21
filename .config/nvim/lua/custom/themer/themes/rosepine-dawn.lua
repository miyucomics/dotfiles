local M = {}

M.base_30 = {
	white = "#575279",
	black = "#faf4ed",
	darker_black = "#f2e9e1",
	black2 = "#EDE1D6",
	one_bg = "#EADCCF",
	one_bg2 = "#E4D2C1",
	one_bg3 = "#DEC7B3",
	grey = "#b0acb9",
	grey_fg = "#A39EAD",
	grey_fg2 = "#9893A4",
	light_grey = "#908B9D",
	red = "#b4637a",
	pink = "#eb6f92",
	line = "#EADCCF",
	green = "#286983",
	blue = "#56949f",
	yellow = "#ea9d34",
	purple = "#907aa9",
	teal = "#3e8fb0",
	orange = "#ea9d34",
	cyan = "#d7827e",
	statusline_bg = "#f2e9e1",
	pmenu_bg = "#907aa9",
	folder_bg = "#56949f",
}

M.base_16 = {
	base00 = "#faf4ed",
	base01 = "#fffaf3",
	base02 = "#f2e9e1",
	base03 = "#9893a5",
	base04 = "#797593",
	base05 = "#575279",
	base06 = "#423e5b",
	base07 = "#dfdad9",
	base08 = "#b4637a",
	base09 = "#ea9d34",
	base0A = "#d7827e",
	base0B = "#56949f",
	base0C = "#286983",
	base0D = "#907aa9",
	base0E = "#ea9d34",
	base0F = "#A39EAD",
}

M.type = "light"

M.polish_hl = {
	Type = { fg = M.base_30.teal },
	["@type.builtin"] = { fg = M.base_30.teal, bold = true },
	["@variable.parameter"] = { fg = M.base_30.purple },
}

return M
