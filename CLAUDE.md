# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on [lazy.nvim](https://github.com/folke/lazy.nvim) (not LazyVim — `lazyvim.json` enables a few LazyVim extras but the core setup is custom). The config targets Neovim 0.11+ and uses the native LSP API (`vim.lsp.config`/`vim.lsp.enable`) rather than nvim-lspconfig's setup helpers.

## Formatting

Lua files are formatted with **stylua**. Settings are in `.stylua.toml`:
- 2-space indent, 120-column width, double-quote preference, no parentheses on calls

Run manually:
```bash
stylua lua/ after/ ftplugin/ init.lua
```

Format-on-save via Conform is enabled for Lua (stylua), Nix (alejandra), and disabled for Haskell (fourmolu must be run manually with `<leader>f`).

## Debugging

Enable the debug module with the `NVIM_DEBUG` environment variable:
```bash
NVIM_DEBUG=1 nvim
```

Inside Neovim, `:DebugLogs` opens all trace logs; `:DebugClear` removes them. Logs land in `~/.cache/nvim/`.

## Architecture

### Entry Point

`init.lua` bootstraps in this order:
1. `shino.debug` — optional tracing (no-op unless `NVIM_DEBUG` is set)
2. `vim-options` — global options and mapleader (`<Space>`)
3. `autocmds` — global autocmds
4. `config.lazy` — lazy.nvim bootstrap, loads all `lua/plugins/*.lua`
5. `shino.commands` — user commands (`:InitLua`)
6. `lsp.init` — global `LspAttach` handler and TypeScript/Deno detection

### Plugin Structure

All plugins live in `lua/plugins/*.lua` — each file returns a lazy.nvim plugin spec. There is no plugin registry file; lazy.nvim scans the directory automatically.

### LSP Setup

LSP uses the Neovim 0.11+ native API instead of lspconfig setup calls:
- **Global keymaps**: `lua/lsp/keymaps.lua` — attached on every `LspAttach` event
- **TypeScript/Deno detection**: `lua/lsp/typescript.lua` — detects `deno.json` vs `package.json` to decide between `denols` and `ts_ls`. Static options are set once via `vim.lsp.config`; `vim.lsp.start` is called per-buffer so exactly one server attaches per file.
- **Per-server configs**: `after/lsp/<server>.lua` — lua_ls, nil_ls, copilot, gh_actions_ls
- **Language-specific plugins** bypass the global attach: rustaceanvim (Rust), haskell-tools.nvim (Haskell), lean.nvim (Lean), nvim-jdtls (Java)

### Completion

**blink.cmp** replaces nvim-cmp. Sources (in priority order): lazydev → lsp → path → buffer → snippets. Snippets use LuaSnip with custom snippet files in `lua/snippets/`.

### LuaSnip Keymaps

| Key | Action |
|-----|--------|
| `<C-K><C-K>` | Expand snippet |
| `<C-K><C-L>` | Jump forward |
| `<C-K><C-J>` | Jump backward |
| `<C-K><C-E>` | Cycle choice node |

### File-Type Specific Setup

`after/ftplugin/<ft>.lua` files run after built-in ftplugins:
- **haskell**: GHCi REPL toggle (`<leader>rr`/`<leader>rf`), Hoogle search (`<space>hs`), eval all (`<space>ea`)
- **rust**: rustaceanvim code actions (`<leader>a`) and hover actions (`K`)
- **zig**: enables `zls` LSP
- **java**: enables `jdtls` LSP

`ftplugin/` (non-after) also has `java.lua` and `markdown.lua`.

### Japanese Input

**skkeleton** + **denops.vim** provides SKK Japanese input. Toggle with `<C-j>` in insert mode. Dictionary at `skk/SKK-JISYO.L`, user dict at `skk/user-dict`.

### Key Global Keymaps

| Key | Mode | Action |
|-----|------|--------|
| `H` / `L` | n | Previous/next buffer |
| `<C-p>` | n | Telescope find files |
| `sg` | n | Telescope live grep |
| `gr` | n | Telescope LSP references |
| `<leader>f` | n/v | Format (Conform + LSP fallback) |
| `<leader>rn` | n | LSP rename |
| `<leader>ca` | n/v | LSP code action |
| `<leader>lh` | n | Toggle inlay hints |
| `<leader>tp` | n | Toggle transparent background |
| `<leader>sc` | n | Toggle Copilot suggestions |
| `<C-h/j/k/l>` | n | Tmux/Neovim pane navigation |
| Arrow keys | n | Resize windows |
| Arrow keys | i | Insert Unicode arrows (←↑→↓) |

### Custom Modules (`lua/shino/`)

- `debug.lua` — opt-in tracing for colorschemes, LSP, plugins, startup. Logs land in `~/.cache/nvim/` (controlled by `stdpath("cache")`, not `XDG_STATE_HOME`).
- `commands.lua` — `:InitLua` (open init.lua in editor)

### Colorscheme

Primary: **catppuccin-mocha** (custom dark base `#12121a`, transparent by default). Falls back to `tokyonight-moon`. Toggle transparency with `<leader>tp`.
