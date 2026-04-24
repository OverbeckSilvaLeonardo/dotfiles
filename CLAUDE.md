# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repo. Currently contains a Neovim config (`nvim/`) based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), plus `v1.vil` (VIAL keyboard layout).

The nvim config is symlinked or copied to `~/.config/nvim/`.

## Architecture

**Entry point:** `nvim/init.lua` — sets options, keymaps, and bootstraps lazy.nvim, then imports plugin specs from two namespaces:

- `lua/kickstart/plugins/` — curated base plugins (LSP, DAP, treesitter, telescope, formatting, UI)
- `lua/custom/plugins/` — personal overrides and additions

**Plugin loading order in `init.lua`:**
```
kickstart.plugins      → top-level files (debug, gitsigns, etc.)
kickstart.plugins.ui   → catppuccin, mini, todo-comments, which-key
kickstart.plugins.tools → conform, guess-indent, telescope
kickstart.plugins.completion → blink.nvim
kickstart.plugins.lsp  → LSP setup
custom.plugins         → nvim-tree, claude-code.nvim, anything personal
```

**LSP servers** are declared in `lua/kickstart/lsp_servers.lua` (imported by `lua/kickstart/plugins/lsp/init.lua`). Active: `gopls`, `pyright`, `jinja_lsp`, `lua_ls`. Mason handles installation.

**Formatting** via conform.nvim (`lua/kickstart/plugins/tools/conform.lua`): `stylua` (Lua), `isort`+`black` (Python), `goimports` (Go), `djlint` (HTML/Django). Formats on save; `<leader>f` for manual format.

**Debug** via nvim-dap (`lua/kickstart/plugins/debug.lua`): Go (delve) and Python (debugpy) pre-configured. DAP debuggers installed by Mason automatically.

**Auto-save** triggers on `InsertLeave` and `TextChanged` (normal buffers only). No manual `:w` needed during editing.

**Colemak remap** exists at `lua/keymaps/colemak_remap.lua` but is commented out in `init.lua`. MNEI = HJKL movement when enabled.

## Adding plugins

Drop a new `.lua` file in `lua/custom/plugins/` returning a lazy.nvim spec. It auto-imports — no registration needed.

## Lua formatting

`nvim/.stylua.toml` controls formatting. Run:
```
stylua nvim/
```

## Key mappings (non-obvious)

| Key | Action |
|-----|--------|
| `<C-b>` / `<M-b>` | Toggle nvim-tree |
| `<leader>f` | Format buffer (conform) |
| `<leader>z` | Toggle no-neck-pain zen centering (120 col width) |
| `<leader>gb` | Toggle git blame (blame.nvim) |
| `<leader>b` / `<leader>B` | DAP toggle/conditional breakpoint |
| `<F5>/<F1>/<F2>/<F3>/<F7>` | DAP continue/step-into/over/out/UI |
| `<C-h/j/k/l>` | Window navigation |

## Custom plugins

- `claude-code.nvim` — Claude Code integration (`greggh/claude-code.nvim`, default setup)
- `no-neck-pain.nvim` — centered layout toggled via `<leader>z`
- `blame.nvim` — inline git blame toggled via `<leader>gb`
