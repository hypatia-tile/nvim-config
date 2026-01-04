vim.api.nvim_create_user_command("InitLua", function()
  vim.cmd.edit(vim.fn.stdpath "config" .. "/init.lua")
end, {
  desc = "Open init.lua",
})

-- FloatNote command
local float_note = require "shino.float_note"
vim.api.nvim_create_user_command("FloatNote", function()
  float_note.toggle("float://note", { width = 0.8, height = 0.8, title = "Note" })
end, {
  nargs = "*",
  desc = "Toggle persistent floating scratch note",
})

vim.keymap.set("n", "<leader>o", ":FloatNote<CR>", { desc = "Toggle floating note" })
