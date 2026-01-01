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
      },
      hls = {
        on_attach = function(client, bufnr)
          -- Disable inlay hints for cabal files to prevent -32601 errors
          if vim.bo[bufnr].filetype == "cabal" then
            client.server_capabilities.inlayHintProvider = nil
          end
        end,
      },
    }
  end,
}
