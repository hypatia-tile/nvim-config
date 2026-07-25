-- Keymaps
local keymap = require "shino.keymap"
keymap.nmap("H", ":bprevious<CR>", "Go to previous tab")
keymap.nmap("L", ":bnext<CR>", "Go to next tab")

-- set mapleader
require "vim-options"
require "autocmds"
require "config.lazy"
require "shino.commands"
require "lsp.init"

-- Folding settings
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldtext = ""

-- Arrow keys resize windows in normal mode
keymap.nmap("<Right>", "<c-w>>", "Write right arrow")
keymap.nmap("<Left>", "<c-w><", "Write left arrow")
keymap.nmap("<Down>", "<c-w>-", "Write down arrow")
keymap.nmap("<Up>", "<c-w>+", "Write up arrow")

-- Arrow keys insert literal Unicode arrows in insert mode
keymap.imap("<Right>", "→", "Write right arrow")
keymap.imap("<Left>", "←", "Write left arrow")
keymap.imap("<Down>", "↓", "Write down arrow")
keymap.imap("<Up>", "↑", "Write up arrow")
