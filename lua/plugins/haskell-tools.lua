return {
  "mrcjkb/haskell-tools.nvim",
  version = "^6", -- Recommended
  lazy = false, -- This plugin is already lazy
  config = function()
    vim.g.haskell_tools = {
      tools = {
        hover = {
          enable = true,
        },
        hoogle = {
          mode = "telescope-local", -- Use telescope to search local docs
        },
        repl = {
          handler = "builtin", -- Use Neovim's terminal
          prefer = "cabal", -- Prefer cabal over stack
          auto_focus = true, -- Jump to REPL when toggled
        },
        codeLens = {
          autoRefresh = true, -- Automatically update code lenses
        },
      },
      hls = {
        on_attach = function(client, bufnr)
          -- Disable inlay hints for cabal files to prevent -32601 errors
          if vim.bo[bufnr].filetype == "cabal" then
            client.server_capabilities.inlayHintProvider = nil
          end
          -- Attach standard LSP keymaps for Haskell files
          if vim.bo[bufnr].filetype == "haskell" then
            require("lsp.keymaps").lsp_keymap(bufnr)
          end
        end,
      },
    }
  end,
}
