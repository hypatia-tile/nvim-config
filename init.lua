vim.env.XDG_STATE_HOME = "/tmp"
-- set mapleader
require "vim-options"
require "config.lazy"
require "shino.commands"
require "lsp.init"

-- Folding settings
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldlevel = 99
vim.wo.foldmethod = "expr"
vim.wo.foldtext = ""
