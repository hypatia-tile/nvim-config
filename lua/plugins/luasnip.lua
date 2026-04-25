return {
  "L3MON4D3/LuaSnip",
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",

  config = function()
    local ls = require "luasnip"
    vim.keymap.set({ "i" }, "<C-K><C-K>", function()
      ls.expand()
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-K><C-L>", function()
      ls.jump(1)
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-K><C-J>", function()
      ls.jump(-1)
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-K><C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })

    -- Load snippets from separate files
    local snippet_files = {
      { lang = "lua", file = "lua" },
      { lang = "all", file = "all" },
      { lang = "lean", file = "lean" },
    }

    for _, spec in ipairs(snippet_files) do
      local ok, snippets = pcall(require, "snippets." .. spec.file)
      if ok then
        ls.add_snippets(spec.lang, snippets)
      else
        vim.notify(
          string.format("Failed to load snippets for %s: %s", spec.lang, snippets),
          vim.log.levels.WARN
        )
      end
    end
  end,
}
