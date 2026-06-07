vim.lsp.config ["clangd"] = {
  cmd = {
    "clangd",
    "--query-driver=/nix/store/*clang*/bin/clang,/nix/store/*gcc*/bin/gcc",
  }
}

vim.lsp.enable "clangd"
