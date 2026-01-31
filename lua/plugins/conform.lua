return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      haskell = { "ormolu" },
      nix = { "alejandra" },
    },
    -- Configure individual formatters
    formatters = {
      ormolu = {
        -- Pass language extensions to ormolu
        -- Note: Ormolu does NOT support configuring formatting style (line length, indentation, etc.)
        -- It only supports configuring language extensions that affect parsing
        prepend_args = {
          -- Common GHC extensions (uncomment the ones your projects use)
          -- "-o", "-XOverloadedStrings",
          -- "-o", "-XImportQualifiedPost",
          -- "-o", "-XTypeApplications",
          -- "-o", "-XLambdaCase",
          -- "-o", "-XBlockArguments",
          -- "-o", "-XDerivingStrategies",
          -- "-o", "-XGHC2021",  -- Use the GHC2021 language extension set
        },
      },
    },
    -- Format on save for all languages EXCEPT Haskell
    format_on_save = function(bufnr)
      -- Disable format-on-save for Haskell (use manual <leader>f instead)
      if vim.bo[bufnr].filetype == "haskell" then
        return
      end
      return { timeout_ms = 500, lsp_fallback = true }
    end,
  },
}
