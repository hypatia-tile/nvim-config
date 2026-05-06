-- Global LspAttach autocmd to attach keymaps to all LSP clients
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    require("lsp.keymaps").lsp_keymap(args.buf)
  end,
})

local ts_filetypes = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "typescript.tsx",
  "json",
}
vim.lsp.config("denols", {
  filetypes = ts_filetypes,
  init_options = {
    enable = true,
    lint = true,
    unstable = true,
    suggest = {
      imports = {
        hosts = {
          ["https://deno.land"] = true,
        },
      },
    },
  },
})
vim.lsp.config("ts_ls", {
  filetypes = ts_filetypes,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = ts_filetypes,
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local root_dir, is_deno = require("lsp.typescript").root_dir(bufnr)
    if is_deno then
      vim.lsp.start {
        name = "denols",
        root_dir = root_dir,
        bufnr = bufnr,
        cmd = { "deno", "lsp" },
      }
    else
      vim.lsp.start {
        name = "ts_ls",
        root_dir = root_dir,
        bufnr = bufnr,
        cmd = { "typescript-language-server", "--stdio" },
      }
    end
  end,
})

vim.lsp.enable "copilot"
