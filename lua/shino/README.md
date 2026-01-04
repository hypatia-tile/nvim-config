# Shino Custom Modules

This directory contains custom Neovim utilities and features.

## Modules

### debug.lua

A comprehensive debug and profiling module for tracing various Neovim events.

#### Features

- **Colorscheme Tracing**: Track when and why colorschemes change
- **LSP Tracing**: Monitor LSP server attach/detach events
- **Plugin Tracing**: Track Lazy.nvim plugin loading events
- **Startup Profiling**: Measure startup time

#### Usage

Enable debugging by setting the `NVIM_DEBUG` environment variable:

```bash
# Enable debug mode
NVIM_DEBUG=1 nvim

# Or export for the session
export NVIM_DEBUG=1
nvim
```

Configure which tracers to enable in `init.lua`:

```lua
require("shino.debug").setup({
  enabled = vim.env.NVIM_DEBUG ~= nil,
  tracers = {
    colorscheme = true,  -- Track colorscheme changes
    lsp = true,          -- Track LSP attach/detach
    plugins = true,      -- Track plugin loading
    startup = true,      -- Track startup time
  },
})
```

#### Commands

- `:DebugLogs` - View all debug logs in a buffer
- `:DebugClear` - Clear all debug log files

#### Log Files

Logs are written to Neovim's cache directory (`~/.cache/nvim` on Linux/macOS):

- `colorscheme-trace.log` - Colorscheme change events
- `lsp-trace.log` - LSP attachment events
- `plugin-trace.log` - Plugin loading events
- `startup-trace.log` - Startup timing

### float_note.lua

Persistent floating scratch buffer system.

#### Features

- Persistent buffer that survives window closes
- Centered floating window with configurable size
- Quick keybindings for close (`qq`) and yank-all (`qy`)

#### Usage

```lua
local float_note = require("shino.float_note")
float_note.toggle("float://note", {
  width = 0.8,   -- 80% of screen width (or absolute pixels if >= 1)
  height = 0.8,  -- 80% of screen height
  title = "Note"
})
```

Default keymap: `<leader>o` (defined in `lua/shino/commands.lua`)

### commands.lua

Custom user commands and their configurations.

Currently defines:
- `FloatNote` - Toggle the floating note window
- Transparency toggle for Catppuccin theme
