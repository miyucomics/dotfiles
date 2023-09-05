require("core.settings")
require("core.keymap")

require("core.bootstrap")

local plugins = {}

for _, plugin in ipairs(require("core.simplePlugins")) do
  table.insert(plugins, plugin)
end

local files = vim.fn.readdir(vim.fn.expand("~/.config/nvim/lua/") .. "plugins")
for _, file in ipairs(files) do
  table.insert(plugins, require("plugins." .. vim.fn.fnamemodify(file, ":t:r")))
end

require("lazy").setup(plugins)
