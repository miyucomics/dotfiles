local if_nil = vim.F.if_nil

local header = {
    type = "text",
    val = {
        [[                                                                  ]],
        [[     _/      _/                      _/      _/  _/               ]],
        [[    _/_/    _/    _/_/      _/_/    _/      _/      _/_/_/  _/_/  ]],
        [[   _/  _/  _/  _/_/_/_/  _/    _/  _/      _/  _/  _/    _/    _/ ]],
        [[  _/    _/_/  _/        _/    _/    _/  _/    _/  _/    _/    _/  ]],
        [[ _/      _/    _/_/_/    _/_/        _/      _/  _/    _/    _/   ]],
        [[                                                                  ]],
    },
    opts = {
        position = "center",
        hl = "Type",
    },
}

local function button(sc, txt, keybind, keybind_opts)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
        position = "center",
        shortcut = sc,
        cursor = 3,
        width = 50,
        align_shortcut = "right",
        hl_shortcut = "Keyword",
    }

    if keybind then
        keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        opts.keymap = { "n", sc_, keybind, keybind_opts }
    end

    return {
        type = "button",
        val = txt,
        on_press = function()
            local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
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
