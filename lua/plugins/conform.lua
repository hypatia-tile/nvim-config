return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup {
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
      formatters_by_ft = {
        lua = { "stylua" },
        haskell = { "ormolu" },
        nix = { "alejandra" },
      },
      -- Format on save for all languages EXCEPT Haskell
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.bo[bufnr].filetype == "haskell" then
          return
        end
        return { timeout_ms = 10000, lsp_fallback = false }
      end,
    }

    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })
    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
    })
  end,
}
