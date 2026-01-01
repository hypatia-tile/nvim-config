return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",
    color_overrides = {
      mocha = {
        base = "#12121a",
        mantle = "#12121a",
        crust = "#12121a",
      },
    },
    transparent_background = true,
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme "catppuccin-mocha"

    -- Custom Telescope selection highlight
    vim.cmd "highlight TelescopeSelection cterm=bold gui=bold guifg=#a6e3a1 guibg=#181825"

    -- Transparency toggle keymap
    vim.keymap.set("n", "<leader>tp", function()
      local cat = require "catppuccin"
      cat.options.transparent_background = not cat.options.transparent_background
      cat.compile()
      vim.cmd.colorscheme "catppuccin-mocha"
    end, { desc = "Toggle transparency" })
  end,
}
