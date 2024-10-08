local M = {}

M.base_30 = {
	white = "#cccdd1",
	darker_black = "#0a0a0a",
	black = "#101010",
	black2 = "#181818",
	one_bg = "#1e1e1e",
	one_bg2 = "#252525",
	one_bg3 = "#2c2c2c",
	grey = "#363636",
	grey_fg = "#3d3d3d",
	grey_fg2 = "#454545",
	light_grey = "#4d4d4d",
	red = "#ff1a67",
	pink = "#ff77a8",
	line = "#2c2c2c",
	green = "#00e756",
	blue = "#29adff",
	yellow = "#fff024",
	purple = "#a79ac0",
	teal = "#0b925c",
	orange = "#ffa300",
	cyan = "#29adff",
	statusline_bg = "#181818",
	pmenu_bg = "#5c6ab2",
	folder_bg = "#29adff",
}

M.base_16 = {
	base00 = "#101010",
	base01 = "#171717",
	base02 = "#1e1e1e",
	base03 = "#252525",
	base04 = "#2c2c2c",
	base05 = "#d8d9dd",
	base06 = "#d2d3d7",
	base07 = "#cccdd1",
	base08 = "#ffb20f",
	base09 = "#ff004d",
	base0A = "#be620a",
	base0B = "#00e756",
	base0C = "#29adff",
	base0D = "#c54bcf",
	base0E = "#ff4394",
	base0F = "#ffccaa",
}

M.polish_hl = {
	["@variable"] = { fg = M.base_30.orange },
	["@variable.parameter"] = { fg = M.base_30.white },
}

M.type = "dark"

return M
