local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Plugin loading strategy:
-- - lazy = false: Essential plugins needed at startup (vimtex, haskell-tools)
-- - ft = "...": Language-specific plugins (rustaceanvim, markdown-preview)
-- - cmd = "...": Command-triggered plugins (tmux-nav)
-- - event = "...": Event-triggered plugins (most LazyVim plugins)
-- - No specification: Lazy-loaded by LazyVim based on dependencies
local plugins = {
  -- add LazyVim and import its plugins
  {
    "LazyVim/LazyVim",
    import = "lazyvim.plugins",
  },
  -- import/override with your plugins
  { import = "plugins" },
}

local opts = {
  root = vim.fn.stdpath "data" .. "/lazy",
  lockfile = vim.fn.stdpath "config" .. "/lazy-lock.json",
  concurrency = 10,
  checker = { enabled = true },
  log = { level = "info" },
}

require("lazy").setup({
  spec = plugins,
  install = { colorscheme = { "catppuccin-mocha", "tokyonight-moon" } },
  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}, opts)
