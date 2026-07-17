# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on [lazy.nvim](https://github.com/folke/lazy.nvim) (not LazyVim — `lazyvim.json` enables a few LazyVim extras but the core setup is custom). The config targets Neovim 0.11+ and uses the native LSP API (`vim.lsp.config`/`vim.lsp.enable`) rather than nvim-lspconfig's setup helpers.

## Claude's role: coach, not author

The owner is a long-time Neovim user; the goal of this repository is now the
owner's deep mastery of Lua and the Neovim API, not just a working config.
From this point on the owner writes all configuration changes themselves.

- Claude MUST NOT edit the Lua configuration: `init.lua`, `lua/`, `after/`,
  and `ftplugin/`.
- Give feedback as a coach: point out bugs, non-idiomatic Lua, misuse of the
  Neovim API, lazy.nvim spec mistakes, startup impact, and convention
  violations — but do not hand over finished fix code. Explain why something
  is a problem and name the exact function, option, or help tag to look up
  (e.g. "see `:h vim.keymap.set()`").
- Exceptions to the edit ban:
  - Generated files (`lazy-lock.json`) are machine-written and out of scope.
  - Minimal fix code may be shown when the config fails to load or a change
    risks data loss.
- Claude owns the meta layer only: this file, `.claude/skills/`, `bin/`,
  `docs/adr/` scaffolding, and (later) CI.

## Decision records

- Decision-class changes (policy, structure, tool adoption) are gated on an
  ADR, as in `.emacs.d`: once a decision is reached in conversation, the
  owner writes the ADR in `docs/adr/` (English, one file per decision,
  `NNNN-kebab-case-title.md`, based on `docs/adr/template.md`), and only
  then does the decision take effect. Progress is bounded by what the owner
  can state in their own words — that articulation is itself the learning
  goal.
- After the ADR is written, Claude updates this file and the skills to
  match it.
- Day-to-day configuration edits do not require an ADR.

## Language policy

- Conversation with the owner and review output may be in Japanese;
  identifiers, function names, and technical terms stay in English.
- All documents, code comments, commit messages, and ADRs are in English.

## Commit conventions

- Conventional Commits, in English: `type(scope): subject`.
- The owner writes every commit message for their own changes;
  `/commit-review` coaches them.

## Review skills

- `/nvim-review` (in `.claude/skills/`) reviews uncommitted changes by
  default, or the last commit when the working tree is clean. It runs
  `bin/check` before reading the diff. Coaching style as defined above;
  review output is in Japanese.
- `/commit-review` reviews a commit message written by the owner. Form
  issues (typos, format) may be corrected directly; content gaps are
  addressed with guiding questions only — never with example sentences,
  even on request.

## Trying the config from this repo

`~/.config/nvim` is a read-only Nix store copy of this repo, placed by
[dotfiles-mac](https://github.com/hypatia-tile/dotfiles-mac) as a pinned
non-flake input. Edits here take effect in the real environment only after
pushing and bumping the pin. To verify the working tree directly:

- `bin/nvim-dev` — launch Neovim on this working tree via
  `NVIM_APPNAME=nvim-dev` (maintains a `~/.config/nvim-dev` symlink to this
  repo; data/state/cache are isolated from the real environment, so the
  first launch installs all plugins).
- `bin/check` — headless load check: full startup including a
  `lazy-lock.json`-faithful plugin restore, sharing the `nvim-dev` data dir.
  Reports errors verbatim and exits non-zero on failure.

## Formatting

Lua files are formatted with **stylua**. Settings are in `.stylua.toml`:
- 2-space indent, 120-column width, double-quote preference, no parentheses on calls

Run manually:
```bash
stylua lua/ after/ ftplugin/ init.lua
```

Format-on-save via Conform is enabled for Lua (stylua), Nix (alejandra), and disabled for Haskell (fourmolu must be run manually with `<leader>f`).

## Debugging

Use `nvim --startuptime /tmp/startup.log` to profile startup time.

## Architecture

### Entry Point

`init.lua` bootstraps in this order:
1. `vim-options` — global options and mapleader (`<Space>`)
2. `autocmds` — global autocmds
3. `config.lazy` — lazy.nvim bootstrap, loads all `lua/plugins/*.lua`
4. `shino.commands` — user commands (`:InitLua`)
5. `lsp.init` — global `LspAttach` handler and TypeScript/Deno detection

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

**skkeleton** + **denops.vim** provides SKK Japanese input. Toggle with `<C-j>` in insert mode. Dictionary at `~/.local/share/skk/SKK-JISYO.L` (placed by dotfiles-mac via Home Manager), user dict at `stdpath("data")/skk/user-dict` — both outside the config dir, which is a read-only Nix store path.

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

- `commands.lua` — `:InitLua` (open init.lua in editor)

### Colorscheme

Primary: **catppuccin-mocha** (custom dark base `#12121a`, transparent by default). Falls back to `tokyonight-moon`. Toggle transparency with `<leader>tp`.
