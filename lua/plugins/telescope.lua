return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require "telescope.builtin"
      vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope: Find files" })
      vim.keymap.set("n", "sg", builtin.live_grep, { desc = "Telescope: Live grep" })
      vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Telescope: LSP references" })
      vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, { desc = "Telescope LSP Doc symbols" })
      vim.keymap.set("n", "<leader>sS", builtin.lsp_workspace_symbols, { desc = "Telescope LSP WS symbols" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {},
          },
        },
      }
      require("telescope").load_extension "ui-select"
    end,
  },
}
