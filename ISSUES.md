# Neovim Configuration Issues

> Generated: 2026-01-01
> Total Issues: 29 (3 Critical, 10 High, 10 Medium, 6 Low)

---

## 🔴 CRITICAL ISSUES (Fix Immediately)

### Issue #1: CoC.nvim Zombie Plugin
- **File**: `coc-settings.json`
- **Severity**: Critical
- **Description**: CoC.nvim plugin was removed from plugin specs but coc-settings.json still exists (451KB orphaned file). The plugin may still be installed in lazy.nvim cache.
- **Impact**: Wasted disk space, potential conflicts if CoC somehow loads
- **Fix**:
  ```bash
  rm coc-settings.json
  # In Neovim: :Lazy clean
  ```
- **Status**: ❌ Open

### Issue #2: Missing LSP Keymaps for Multiple Languages
- **Files**:
  - `after/ftplugin/c.lua:1`
  - `after/ftplugin/cpp.lua:1`
  - `after/ftplugin/nix.lua:1`
  - `lua/lsp/init.lua:31-43` (TypeScript/Deno)
- **Severity**: Critical
- **Description**: LSP servers (clangd, nil_ls, ts_ls, denols) are enabled via `vim.lsp.enable()` but never get keymaps attached. Only lua_ls has an `on_attach` callback. This means no `gd`, `K`, `<leader>rn`, `<leader>ca`, etc. for these languages.
- **Impact**: LSP features completely unusable for C/C++, Nix, and TypeScript
- **Fix**: Add global LspAttach autocmd in `lua/lsp/init.lua`:
  ```lua
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      require("lsp.keymaps").lsp_keymap(args.buf)
    end,
  })
  ```
- **Status**: ❌ Open

### Issue #3: Orphaned LSP Configuration Files
- **Files**:
  - `lsp/lua_ls.lua` (exists but never loaded)
  - `lsp/nil_ls.lua` (exists but never loaded)
- **Severity**: Critical
- **Description**: The `lsp/` directory at config root is NOT auto-loaded by Neovim. These configs are completely bypassed. The new Neovim 0.11+ LSP API uses `after/lsp/` for auto-loading.
- **Impact**: Lua and Nix LSP missing important configuration (LuaJIT runtime, workspace setup, etc.)
- **Fix**:
  ```bash
  mv lsp/lua_ls.lua after/lsp/lua_ls.lua
  mv lsp/nil_ls.lua after/lsp/nil_ls.lua
  rmdir lsp/  # Directory should be empty now
  ```
- **Status**: ❌ Open

---

## 🟠 HIGH PRIORITY ISSUES (Fix Soon)

### Issue #4: Duplicate VimTeX Plugin Definitions
- **Files**:
  - `lua/plugins/vimtex.lua` (active)
  - `lua/plugins/tex.lua:1-2` (disabled with early return)
- **Severity**: High
- **Description**: Two VimTeX plugin specs exist. `tex.lua` is dead code. Additionally, `vimtex.lua` has unnecessary dependency on `AstroNvim/astrocore` (you're using LazyVim, not AstroNvim).
- **Impact**: Dead code, unnecessary plugin dependency
- **Fix**:
  ```bash
  rm lua/plugins/tex.lua
  # Remove AstroNvim dependency from vimtex.lua
  ```
- **Status**: ❌ Open

### Issue #5: Dead TeX ftplugin File
- **File**: `ftplugin/tex.lua:1-2`
- **Severity**: High
- **Description**: Contains `if true then return {} end` making it completely dead code that runs on every TeX file open but does nothing.
- **Impact**: Unnecessary file processing on every TeX file
- **Fix**:
  ```bash
  rm ftplugin/tex.lua
  ```
- **Status**: ❌ Open

### Issue #6: Incorrect Mini.nvim Plugin Name
- **File**: `lua/plugins/autopairs.lua:3`
- **Severity**: High
- **Description**: Uses `nvim-mini/mini.pairs` but correct GitHub org is `echasnovski`. While this works (LazyVim likely imports it), it's inconsistent.
- **Impact**: Confusion, potential future breakage
- **Fix**:
  ```lua
  -- Change line 3 to:
  'echasnovski/mini.pairs',
  ```
- **Status**: ❌ Open

### Issue #7: Duplicate Catppuccin Configuration
- **Files**:
  - `init.lua:8-19` (manual setup)
  - `lua/plugins/catppuccin.lua:1-8` (plugin spec)
- **Severity**: High
- **Description**: Catppuccin configured in TWO places. Colorscheme is set THREE times (plugin spec, init.lua line 19, init.lua line 26 in transparency keymap).
- **Impact**: Redundant code, unclear source of truth
- **Fix**: Move all configuration to `lua/plugins/catppuccin.lua`:
  ```lua
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
    end,
  }
  -- Then remove init.lua lines 8-19
  ```
- **Status**: ❌ Open

### Issue #8: Invalid mason-lspconfig Option
- **File**: `lua/plugins/lsp-config.lua:21-27`
- **Severity**: High
- **Description**: Uses `automatic_enable` which is NOT a valid mason-lspconfig option. Correct option is `automatic_installation`. This configuration does nothing.
- **Impact**: Intended behavior (excluding servers) not working
- **Fix**:
  ```lua
  -- Replace with:
  automatic_installation = {
    exclude = { "rust_analyzer", "ts_ls", "denols" }
  }
  ```
- **Status**: ❌ Open

### Issue #9: Formatting Conflict - LSP vs Conform
- **Files**:
  - `lua/lsp/keymaps.lua:30-32` (maps `<leader>f` to `vim.lsp.buf.format`)
  - `lua/plugins/conform.lua:1-10` (conform.nvim installed)
- **Severity**: High
- **Description**: `<leader>f` uses LSP formatting, but Conform.nvim is also installed. Unclear which formatter runs, creates ambiguity.
- **Impact**: Unpredictable formatting behavior
- **Fix**: Use Conform as the formatter:
  ```lua
  -- In lua/lsp/keymaps.lua, replace formatting keymap:
  map({ "n", "v" }, "<leader>f", function()
    require("conform").format({ async = true, lsp_fallback = true })
  end, "Format with Conform")
  ```
- **Status**: ❌ Open

### Issue #10: None-ls and Conform Overlap
- **Files**:
  - `lua/plugins/none-ls.lua` (installed with empty `opts = {}`)
  - `lua/plugins/conform.lua` (handles same formatters)
- **Severity**: High
- **Description**: Both none-ls and conform.nvim installed but none-ls not configured for any sources. Redundant formatter frameworks.
- **Impact**: Unnecessary plugin, potential conflicts
- **Fix**: Choose one:
  - Option A: Remove none-ls, keep conform (recommended)
  - Option B: Configure none-ls properly, remove conform
- **Status**: ❌ Open

### Issue #11: Unused vim-test Dependency
- **File**: `lua/plugins/none-ls.lua:4`
- **Severity**: High
- **Description**: `vim-test` listed as dependency of none-ls but none-ls doesn't require it and there's no vim-test configuration.
- **Impact**: Unnecessary plugin installation
- **Fix**: Remove `"vim-test/vim-test"` from dependencies
- **Status**: ❌ Open

### Issue #12: Incomplete nvim-dap Configuration
- **File**: `lua/plugins/bap.lua:5`
- **Severity**: High
- **Description**: nvim-dap installed with `lazy = false` (loaded immediately) but only has a TODO comment. No actual configuration.
- **Impact**: Plugin loaded at startup but does nothing, wastes resources
- **Fix**:
  ```lua
  -- Either configure it or change to:
  lazy = true,  -- Don't load until configured
  ```
- **Status**: ❌ Open

### Issue #13: Duplicate Lua ftplugin Files
- **Files**:
  - `ftplugin/lua.lua` (sets indentation)
  - `after/ftplugin/lua.lua` (sets textwidth)
- **Severity**: High
- **Description**: Two separate Lua ftplugin files with duplicate guards. Settings split across two files.
- **Impact**: Confusing organization
- **Fix**: Consolidate all Lua settings into `after/ftplugin/lua.lua`:
  ```lua
  vim.opt_local.shiftwidth = 2
  vim.opt_local.tabstop = 2
  vim.opt_local.textwidth = 100
  ```
  Then delete `ftplugin/lua.lua`
- **Status**: ❌ Open

---

## 🟡 MEDIUM PRIORITY ISSUES (Clean Up When Possible)

### Issue #14: Excessive Debug Notifications
- **Files**:
  - `lua/lsp/init.lua:14,34`
  - `lua/plugins/treesitter.lua:1`
  - `lua/plugins/vimtex.lua:17,20`
  - `lua/plugins/bap.lua:6`
- **Severity**: Medium
- **Description**: Multiple `vim.notify()` calls spam notifications on startup/file open.
- **Impact**: Annoying notifications in production use
- **Fix**: Remove or comment out non-critical notifications
- **Status**: ❌ Open

### Issue #15: LazyVim Extras Not Fully Utilized
- **File**: `lazyvim.json:2-7`
- **Severity**: Medium
- **Description**: LazyVim extras declared (`lang.haskell`, `lang.tex`, etc.) but custom plugin configs created that might conflict.
- **Impact**: Potential duplication, unclear which config is active
- **Fix**: Review if custom configs are needed or if LazyVim extras sufficient
- **Status**: ❌ Open

### Issue #16: Orphaned LazyVim Plugins
- **Severity**: Medium
- **Description**: LazyVim installs many plugins with no custom configuration: bufferline.nvim, flash.nvim, noice.nvim, persistence.nvim, snacks.nvim, grug-far.nvim, trouble.nvim, todo-comments.nvim, nvim-lint, render-markdown.nvim, SchemaStore.nvim, mini.ai, mini.icons
- **Impact**: Unknown feature set, potential unused plugins
- **Fix**: Either configure these or disable unwanted LazyVim extras
- **Status**: ❌ Open

### Issue #17: Duplicate Float Note Modules
- **Files**:
  - `lua/float_note.lua` (wrapper)
  - `lua/shino/float_note.lua` (actual implementation)
- **Severity**: Medium
- **Description**: Two modules exist. First just wraps the second - unnecessary indirection.
- **Impact**: Confusing organization
- **Fix**:
  ```lua
  -- In init.lua, change to:
  require "shino.float_note"
  -- Then delete lua/float_note.lua
  ```
- **Status**: ❌ Open

### Issue #18: Missing Haskell Standard LSP Keymaps
- **File**: `lua/plugins/haskell-tools.lua:13-18`
- **Severity**: Medium
- **Description**: Haskell-tools on_attach disables cabal inlay hints but doesn't call standard LSP keymap setup. Haskell-specific keymaps in ftplugin, but general LSP keymaps missing.
- **Impact**: Some standard LSP features might not have keybindings
- **Fix**:
  ```lua
  on_attach = function(client, bufnr)
    if vim.bo[bufnr].filetype == "cabal" then
      client.server_capabilities.inlayHintProvider = nil
    end
    require("lsp.keymaps").lsp_keymap(bufnr)  -- Add this
  end,
  ```
- **Status**: ❌ Open

### Issue #19: Inconsistent Quote Style
- **Files**: Multiple
- **Severity**: Medium
- **Description**: Mix of single quotes and double quotes throughout config.
- **Impact**: Style inconsistency
- **Fix**: Standardize on double quotes
- **Status**: ❌ Open

### Issue #20: Deprecated Inlay Hint API Usage
- **File**: `lua/lsp/keymaps.lua:43`
- **Severity**: Medium
- **Description**: Inlay hint check uses old API signature. In Neovim 0.12, `is_enabled` takes filter table.
- **Impact**: May break in future Neovim versions
- **Fix**:
  ```lua
  local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
  vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
  ```
- **Status**: ❌ Open

### Issue #21: Commented Code in TypeScript LSP
- **File**: `lua/lsp/init.lua:38-40`
- **Severity**: Medium
- **Description**: Commented-out handlers in ts_ls config.
- **Impact**: Dead code clutter
- **Fix**: Remove commented code
- **Status**: ❌ Open

### Issue #22: Telescope Old Tag Pin
- **File**: `lua/plugins/telescope.lua:3`
- **Severity**: Medium
- **Description**: Pinned to old tag `0.1.8`. Latest is likely newer.
- **Impact**: Missing bug fixes and features
- **Fix**: Update to latest tag or remove pinning
- **Status**: ❌ Open

### Issue #23: Missing Float Note Keymap Cleanup
- **File**: `lua/shino/float_note.lua:61-71`
- **Severity**: Medium
- **Description**: Buffer-local keymaps `qq` and `qy` not added to `b:undo_ftplugin`.
- **Impact**: Minor - keymaps persist if buffer filetype changes
- **Fix**: Not critical for nofile buffers, but technically incomplete
- **Status**: ❌ Open

---

## 🟢 LOW PRIORITY ISSUES (Minor Improvements)

### Issue #24: Unused nvim-lspconfig Plugin
- **File**: `lua/plugins/lsp-config.lua:32`
- **Severity**: Low
- **Description**: nvim-lspconfig installed as dependency but never used (using new Neovim 0.11+ built-in API).
- **Impact**: None - likely required by mason-lspconfig
- **Fix**: None needed, just noting
- **Status**: ❌ Open

### Issue #25: Unnecessary Treesitter Branch Spec
- **File**: `lua/plugins/treesitter.lua:4`
- **Severity**: Low
- **Description**: `branch = "main"` unnecessary (main is default).
- **Impact**: None - just redundant
- **Fix**: Remove for cleaner config
- **Status**: ❌ Open

### Issue #26: Unclear Deprecated Diagnostic Keymaps
- **File**: `lua/lsp/keymaps.lua:23,25`
- **Severity**: Low
- **Description**: Comments mark `[d` and `]d` as deprecated but they're still mapped and valid.
- **Impact**: Confusing comments
- **Fix**: Remove @deprecated comments (these keymaps are fine)
- **Status**: ❌ Open

### Issue #27: Inconsistent Plugin Loading Strategy
- **Severity**: Low
- **Description**: Some plugins use `lazy = false`, others `ft = ...`, others `cmd = ...`, some have no spec. No clear pattern.
- **Impact**: Unclear loading strategy
- **Fix**: Document rationale or standardize
- **Status**: ❌ Open

### Issue #28: .gitignore Completeness
- **File**: `.gitignore`
- **Severity**: Low
- **Description**: Should verify lazy-lock.json and plugin-generated files properly tracked/ignored.
- **Impact**: Minor - may commit unwanted files
- **Fix**: Review .gitignore
- **Status**: ❌ Open

### Issue #29: TypeScript Root Detection Fallback
- **File**: `lua/lsp/typescript.lua:16`
- **Severity**: Low
- **Description**: Falls back to `vim.fn.expand "%:h"` with `is_deno = true` when no markers found. Should default to tsserver (false).
- **Impact**: Standalone TS files treated as Deno projects
- **Fix**:
  ```lua
  return vim.fn.expand "%:h", false  -- Default to non-Deno
  ```
- **Status**: ❌ Open

---

## 📊 Summary

| Priority | Count | Status |
|----------|-------|--------|
| Critical | 3 | ❌ 3 open |
| High | 10 | ❌ 10 open |
| Medium | 10 | ❌ 10 open |
| Low | 6 | ❌ 6 open |
| **Total** | **29** | **❌ 29 open** |

---

## 🎯 Recommended Fix Order

### Phase 1: Critical Fixes (Required)
1. ✅ Issue #2 - Add global LspAttach autocmd
2. ✅ Issue #3 - Move orphaned LSP configs
3. ✅ Issue #1 - Delete coc-settings.json

### Phase 2: High Priority (Important)
4. ✅ Issue #8 - Fix mason-lspconfig option
5. ✅ Issue #9 - Resolve formatting conflicts
6. ✅ Issue #10 - Choose formatter framework
7. ✅ Issue #7 - Consolidate Catppuccin config
8. ✅ Issue #4, #5 - Clean up VimTeX duplicates
9. ✅ Issue #13 - Consolidate Lua ftplugin

### Phase 3: Medium Priority (Cleanup)
10. ✅ Issue #14 - Remove debug notifications
11. ✅ Issue #17 - Fix float_note module duplication
12. ✅ Issue #18 - Add Haskell LSP keymaps
13. Review remaining medium issues

### Phase 4: Low Priority (Polish)
14. Address style and minor issues as time permits

---

*This file tracks known issues in the Neovim configuration. Mark issues as ✅ when fixed.*
