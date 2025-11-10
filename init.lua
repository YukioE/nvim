vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("options")
require("keymaps")
require("colorscheme")
require("autocmds")
require("lsp")

require("plugins.oil")
require("plugins.which-key")
require("plugins.telescope")
require("plugins.blink")
require("plugins.autopairs")
require("plugins.autotags")
require("plugins.treesitter")
require("plugins.lualine")
require("plugins.gitsigns")

--vim.pack.update()
