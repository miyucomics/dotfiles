-- credits to original theme for existing https://github.com/BeardedBear/bearded-theme ( arc version )
-- This is just a modified version of it

local M = {}

M.base_30 = {
	white = "#ABB7C1",
	darker_black = "#19212e",
	black = "#1c2433",
	black2 = "#232b3a",
	one_bg = "#262e3d",
	one_bg2 = "#303847",
	one_bg3 = "#3a4251",
	grey = "#444c5b",
	grey_fg = "#4e5665",
	grey_fg2 = "#58606f",
	light_grey = "#626a79",
	red = "#FF738A",
	pink = "#ee9cdd",
	line = "#303847",
	green = "#3CEC85",
	blue = "#69C3FF",
	yellow = "#EACD61",
	purple = "#bd93ff",
	teal = "#12c7c4",
	orange = "#FF955C",
	cyan = "#22ECDB",
	statusline_bg = "#232b3a",
	pmenu_bg = "#3CEC85",
	folder_bg = "#69C3FF",
}

M.base_16 = {
	base00 = "#1c2433",
	base01 = "#262e3d",
	base02 = "#303847",
	base03 = "#444c5b",
	base04 = "#a1adb7",
	base05 = "#c3cfd9",
	base06 = "#ABB7C1",
	base07 = "#08bdba",
	base08 = "#FF738A",
	base09 = "#FF955C",
	base0A = "#EACD61",
	base0B = "#3CEC85",
	base0C = "#77aed7",
	base0D = "#69C3FF",
	base0E = "#22ECDB",
	base0F = "#B78AFF",
}

M.type = "dark"

M.polish_hl = {
	["@variable.parameter"] = { fg = M.base_30.pink },
	["@attribute"] = { fg = M.base_30.purple },
}

return M
