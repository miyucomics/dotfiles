require("core.settings")
require("core.keymap")

require("core.bootstrap")

require("lazy").setup("plugins", {
    defaults = {
        -- lazy = true,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "editorconfig",
                "gzip",
                "netrwPlugin",
                "rplugin",
                "shada",
                "spellfile",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
