-- skkeleton {{{
return {
  "vim-skk/skkeleton",
  dependencies = { "vim-denops/denops.vim" },
  lazy = false, -- Load on startup so denops can discover it
  keys = {
    { "<C-j>", "<Plug>(skkeleton-toggle)", desc = "Toggle skkeleton", mode = "i" },
  },
  config = function()
    vim.fn["skkeleton#config"] {
      globalDictionaries = {
        vim.fn.expand(vim.fn.stdpath "config" .. "/skk/SKK-JISYO.L"),
      },
      userDictionary = vim.fn.expand(vim.fn.stdpath "config" .. "/skk/user-dict"),
      eggLikeNewline = true,
    }
  end,
}
-- }}}
