-- credit to original theme for existing : https://github.com/kdheepak/monochrome.nvim
-- NOTE: This is a modified version of it

local M = {}

M.base_30 = {
    white = "#D8DEE9",
    darker_black = "#1a1a1a",
    black = "#101010",
    black2 = "#202020",
    one_bg = "#242424",
    one_bg2 = "#2e2e2e",
    one_bg3 = "#383838",
    grey = "#424242",
    grey_fg = "#4c4c4c",
    grey_fg2 = "#606060",
    light_grey = "#677777",
    red = "#ec8989",
    pink = "#da838b",
    line = "#2e2e2e",
    green = "#c9d36a",
    blue = "#8abae1",
    yellow = "#ffe6b5",
    purple = "#e1bee9",
    teal = "#6484a4",
    orange = "#efb6a0",
    cyan = "#9aafe6",
    statusline_bg = "#1e1e1e",
    pmenu_bg = "#859ba2",
    folder_bg = "#7797b7",
}

M.base_16 = {
    base00 = "#101010",
    base01 = "#1f1f1f",
    base02 = "#2e2e2e",
    base03 = "#383838",
    base04 = "#424242",
    base05 = "#bfc5d0",
    base06 = "#c7cdd8",
    base07 = "#ced4df",
    base08 = "#eee8d5",
    base09 = "#B8B7B1",
    base0A = "#859ba2",
    base0B = "#7b9198",
    base0C = "#DFDFDA",
    base0D = "#ced4df",
    base0E = "#DAD4C3",
    base0F = "#ced4df",
}

M.polish_hl = {
    treesitter = {
        ["@punctuation.bracket"] = { fg = M.base_30.red },
    },
}

M.type = "dark"

return M
