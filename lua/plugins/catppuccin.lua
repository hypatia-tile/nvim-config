return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
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

    -- Try to set catppuccin, fallback to tokyonight-moon if it fails
    local ok = pcall(vim.cmd.colorscheme, "catppuccin-mocha")
    if not ok then
      vim.notify("Failed to load catppuccin, falling back to tokyonight-moon", vim.log.levels.WARN)
      vim.cmd.colorscheme "tokyonight-moon"
    end

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
