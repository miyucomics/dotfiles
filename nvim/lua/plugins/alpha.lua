local header = {
    type = "text",
    val = {
        "           ▄ ▄                   ",
        "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
        "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
        "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
        "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
        "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
        "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
        "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
        "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
    },
    opts = {
        position = "center",
        hl = "Type",
    },
}

local function button(shortcut, txt, command)
    local run = shortcut:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
        position = "center",
        shortcut = shortcut,
        cursor = 3,
        width = 50,
        align_shortcut = "right",
        hl_shortcut = "Keyword",
        keymap = { "n", run, command, { noremap = true, silent = true, nowait = true } },
    }

    return {
        type = "button",
        val = txt,
        on_press = function()
            local key = vim.api.nvim_replace_termcodes(run, true, false, true)
            vim.api.nvim_feedkeys(key, "t", false)
        end,
        opts = opts,
    }
end

local buttons = {
    type = "group",
    val = {
        button("e", "  New file", "<cmd>ene <CR>"),
        button("SPC SPC", "󰈞  Find file", "<cmd>Telescope find_files<CR>"),
        button("SPC f h", "  Recent files", "<cmd>Telescope oldfiles<CR>"),
        button("SPC f c", "🖌 Color scheme", "<cmd>Telescope colorscheme<CR>"),
        button("SPC q", "ⓧ  Quit Neovim", "<cmd>wqa<CR>"),
    },
    opts = {
        spacing = 1,
    },
}

local footer = {
    type = "text",
    val = "I use Arch, btw",
    opts = {
        position = "center",
        hl = "Number",
    },
}

return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        layout = {
            { type = "padding", val = 2 },
            header,
            { type = "padding", val = 2 },
            buttons,
            footer,
        },
        opts = {
            margin = 5,
        },
    },
}
