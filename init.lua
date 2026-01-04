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
