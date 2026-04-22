vim.env.XDG_STATE_HOME = "/tmp"

-- Debug/profiling module (enable with NVIM_DEBUG=1)
require("shino.debug").setup {
  enabled = vim.env.NVIM_DEBUG ~= nil,
  tracers = {
    colorscheme = true, -- Track colorscheme changes
    lsp = false, -- Track LSP attach/detach (enable when debugging LSP)
    plugins = false, -- Track plugin loading (enable when debugging plugins)
    startup = true, -- Track startup time
  },
}

-- Keymaps
vim.keymap.set("n", "H", ":bprevious<CR>", { silent = true, noremap = true, desc = "Go to previous tab" })
vim.keymap.set("n", "L", ":bnext<CR>", { silent = true, noremap = true, desc = "Go to next tab" })

-- set mapleader
require "vim-options"
require "autocmds"
require "config.lazy"
require "shino.commands"
require "lsp.init"

-- Folding settings
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldlevel = 99
vim.wo.foldmethod = "expr"
vim.wo.foldtext = ""

-- Arrow * Different interpretation of bytes
vim.keymap.set("n", "<Right>", "<c-w>>", {
  noremap = true,
  desc = "Write right arrow",
})
vim.keymap.set("n", "<Left>", "<c-w><", {
  noremap = true,
  desc = "Write left arrow",
})
vim.keymap.set("n", "<Down>", "<c-w>-", {
  noremap = true,
  desc = "Write down arrow",
})
vim.keymap.set("n", "<Up>", "<c-w>+", {
  noremap = true,
  desc = "Write up arrow",
})

vim.keymap.set("i", "<Right>", "→", {
  noremap = true,
  desc = "Write right arrow",
})
vim.keymap.set("i", "<Left>", "←", {
  noremap = true,
  desc = "Write left arrow",
})
vim.keymap.set("i", "<Down>", "↓", {
  noremap = true,
  desc = "Write down arrow",
})
vim.keymap.set("i", "<Up>", "↑", {
  noremap = true,
  desc = "Write up arrow",
})
