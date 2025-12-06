vim.b.autoformat = false
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.spell = true
vim.opt_local.conceallevel = 2
vim.g.mkdp_auto_start = 0 -- Set to 1 to auto start markdown preview window after entering markdown buffer
vim.g.mkdp_auto_close = 1 -- Set to 1 to auto close current preview window when changing from Markdown buffer
vim.g.mkdp_refresh_slow = 0
vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { buffer = true, desc = "Markdown Preview" })
