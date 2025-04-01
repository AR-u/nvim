-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.options")
vim.g.transparent_background = false
require("fany.utils.neovide").init()
