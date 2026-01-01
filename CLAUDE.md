# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a LazyVim-based Neovim configuration for multi-language development, with strong support for Haskell, Rust, TypeScript/Deno, LaTeX, Lua, Nix, and C/C++. The configuration uses Lazy.nvim as the plugin manager and is structured for modularity and maintainability.

## Architecture

### Initialization Flow

1. **init.lua** - Main entry point that loads modules in this order:
   - `vim-options.lua` - Global settings (leader keys, tabs, clipboard, file type detection)
   - `config.lazy` - Plugin manager setup
   - `float_note` - Custom floating note feature
   - `shino.commands` - Custom user commands
   - `lsp.init` - LSP configuration and TypeScript/Deno detection
   - Catppuccin theme setup with transparency toggle
   - Treesitter-based folding configuration

2. **Plugin Loading** - Lazy.nvim loads plugins from:
   - LazyVim base plugins (`import = "lazyvim.plugins"`)
   - Custom plugins in `lua/plugins/*.lua` (each file returns a plugin spec)
   - LazyVim extras defined in `lazyvim.json`

3. **LSP Configuration** - Split between:
   - `lua/lsp/init.lua` - TypeScript/Deno auto-detection and Copilot enablement
   - `lsp/*.lua` - Individual LSP server configurations (hls.lua, lua_ls.lua, nil_ls.lua)
   - `lua/lsp/keymaps.lua` - LSP keybindings (assumed to exist based on lua_ls.lua reference)

### Key Architectural Patterns

#### TypeScript/Deno Detection System

The config automatically detects whether a project uses Deno or Node.js:
- **Deno detection**: Looks for `deno.json` or `deno.jsonc` in parent directories
- **Node.js detection**: Looks for `package.json`
- **Fallback**: Uses current directory if neither found, defaulting to Deno mode

Location: `lua/lsp/typescript.lua` defines the detection logic, `lua/lsp/init.lua` applies it on FileType autocmd.

#### Plugin Organization

Each plugin lives in its own file under `lua/plugins/`:
- Plugin files export a Lazy.nvim spec table
- Plugin configuration uses `opts` for simple configs or `config` function for complex setup
- Language-specific plugins use `ft` for lazy-loading (e.g., haskell-tools, rustaceanvim)

#### LSP Server Configuration

LSP configs in `lsp/` directory are separate from plugin definitions:
- Return tables with server-specific settings (cmd, filetypes, root_dir, settings)
- Use lspconfig.util for root pattern matching
- lua_ls has special handling for Neovim config directory detection

#### File Type Plugins

`ftplugin/` contains language-specific settings that apply when opening files:
- `markdown.lua` - Wrapping, spell check, markdown preview keymap
- `tex.lua` - LaTeX concealment, wrapping, spell check
- `lua.lua` - 2-space indentation, reload guards

### Custom Features

#### Floating Note System

`lua/shino/float_note.lua` implements a persistent scratch buffer in a floating window:
- Buffer persists across window closes (bufhidden=hide)
- Centered layout with configurable width/height (ratio 0-1 or absolute pixels)
- Keybindings: `qq` to close, `qy` to yank all and close
- Toggled via `<leader>o` keybind

#### Transparency Toggle

`init.lua:22-27` - Dynamically toggles Catppuccin's transparent_background by recompiling the theme.

## Language-Specific Details

### Haskell
- LSP: haskell-language-server-wrapper via haskell-tools.nvim
- Formatter: ormolu (changed from fourmolu - see lsp/hls.lua:12)
- Root patterns: hie.yaml, cabal.project, stack.yaml, package.yaml, .git

### Lua
- LSP: lua-language-server with LuaJIT runtime
- Special detection for Neovim config directory to load Neovim APIs
- Suppresses warnings for underscore-prefixed unused variables

### TypeScript/JavaScript
- Auto-switches between denols and ts_ls based on project detection
- Deno projects get lint, unstable features, and import suggestions enabled
- Notification shown when LSP is selected

### LaTeX
- VimTeX plugin handles compilation and viewing
- Treesitter disabled for TeX files (uses VimTeX syntax instead)
- Platform-specific PDF viewer selection (Skim on macOS, Zathura on Linux)

### Rust
- rustaceanvim handles rust-analyzer integration
- Lazy-loaded only for Rust files

### Nix
- nil LSP with alejandra formatter

### C/C++
- clangd via native Neovim LSP
- Enabled in `after/ftplugin/c.lua` and `after/ftplugin/cpp.lua`

## Formatting

Formatters are managed by conform.nvim (lua/plugins/conform.lua):
- Lua → stylua
- Haskell → ormolu
- Nix → alejandra

Additional formatters/linters via mason-null-ls:
- stylua
- markdownlint-cli2

## File Type Detection

Custom patterns in vim-options.lua:
- `compose*.yaml` → yaml.docker-compose
- `.github/workflows/*.yaml` → yaml.github-actions
- `.env.*` → sh.env

## Keybinding System

Leader keys:
- `<Space>` - Primary leader
- `\` - Local leader (used for VimTeX)

Core navigation:
- `<C-p>` - Telescope find files
- `<leader>ff` - Telescope live grep
- `<leader>?` - Which-Key buffer keymaps
- `<C-h/j/k/l>` - Tmux-aware navigation

LSP keybindings are centralized in lua/lsp/keymaps.lua and attached via on_attach callbacks.

## Common Modifications

### Adding a New Language

1. Add LSP config in `lsp/<language>.lua` following the pattern of existing configs
2. Create plugin file in `lua/plugins/<language>.lua` if using a specialized plugin
3. Add formatter to `lua/plugins/conform.lua` formatters_by_ft table
4. Add ftplugin in `ftplugin/<language>.lua` for language-specific settings
5. If using LazyVim extras, add to lazyvim.json extras array

### Modifying LSP Behavior

- LSP keybindings: Edit `lua/lsp/keymaps.lua`
- Server-specific settings: Edit `lsp/<server>.lua`
- Auto-detection logic: Edit `lua/lsp/<language>.lua` or `lua/lsp/init.lua`

### Adding Plugins

Create a new file `lua/plugins/<name>.lua` that returns a Lazy.nvim spec:
```lua
return {
  "author/plugin-name",
  opts = {
    -- configuration
  },
}
```

Lazy.nvim automatically loads all files in the plugins directory.

## Global Settings

Defined in lua/vim-options.lua:
- Indentation: 2 spaces (expandtab)
- Line numbers: absolute + relative
- Clipboard: system clipboard integration
- No transparency for windows/popup menus (winblend=0, pumblend=0)
- Catppuccin custom background: #12121a (dark purple-black)

## Performance Optimizations

Disabled built-in plugins (lua/config/lazy.lua:44-50):
- gzip, tarPlugin, tohtml, tutor, zipPlugin

Lazy-loading strategies:
- Most plugins lazy-load based on events, filetypes, or commands
- Treesitter parsers installed only for actively used languages
