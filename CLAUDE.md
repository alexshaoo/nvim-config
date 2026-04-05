# Neovim Config

## Architecture

Modular Lazy.nvim config under `lua/alex/`:

```
init.lua                  -- Entry point: loads core + lazy, defines :Compile/:Run commands
lua/alex/
  core/
    init.lua              -- Requires options + keymaps
    options.lua           -- Editor settings (2-space tabs, relative numbers, system clipboard)
    keymaps.lua           -- Global keymaps (Space as leader)
  lazy.lua                -- Bootstraps Lazy.nvim, auto-discovers specs from plugins/
  plugins/
    init.lua              -- Base plugin list
    *.lua                 -- One file per plugin spec (lazy-loaded by event)
```

## Plugin Manager

Lazy.nvim bootstrapped in `lua/alex/lazy.lua`. Plugin specs are individual files in `lua/alex/plugins/` — Lazy auto-discovers them via `require("lazy").setup("alex.plugins")`.

## C++ Competitive Programming Workflow

This is the primary use case for this config — single-file C++ competitive programming.

Two custom commands in `init.lua`:
- `:Compile` — runs `g++-15 -std=c++23 -Wall -Wextra -O2` on the current file (Homebrew GCC, not Apple Clang), output in a bottom terminal split
- `:Run [input_file]` — runs the compiled binary with stdin from `input.txt` (default) or a specified file

## LSP & Formatting

- **LSP**: `nvim-lspconfig` with clangd (background indexing, clang-tidy enabled, header insertion disabled)
- **Formatting**: `conform.nvim` with clang-format for C/C++, format-on-save enabled, manual format via `<leader>cf`

## Key Conventions

- **Leader**: Space (`vim.g.mapleader = " "`)
- **Lazy loading**: plugins use `event = { "BufReadPre", "BufNewFile" }` pattern
- **Theme**: Catppuccin
- **Completion**: nvim-cmp with LuaSnip
- **File explorer**: nvim-tree
- **Fuzzy finder**: Telescope

## Keybind Reference

### Core (keymaps.lua)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>sv` | n | Split window vertically |
| `<leader>sh` | n | Split window horizontally |
| `<leader>se` | n | Make splits equal size |
| `<leader>sx` | n | Close current split |
| `<leader>to` | n | Open new tab |
| `<leader>tx` | n | Close current tab |
| `<leader>tn` | n | Go to next tab |
| `<leader>tp` | n | Go to previous tab |
| `<leader>tf` | n | Open current buffer in new tab |
| `gl` | n | Show diagnostics in location list (bottom split) |
| `[d` | n | Previous diagnostic (no float) |
| `]d` | n | Next diagnostic (no float) |

### Split Navigation (vim-tmux-navigator)

| Key | Mode | Action |
|-----|------|--------|
| `<C-h>` | n | Focus left split (e.g., nvim-tree) |
| `<C-j>` | n | Focus split below (e.g., terminal, location list) |
| `<C-k>` | n | Focus split above (back to code) |
| `<C-l>` | n | Focus right split |

### Treesitter (treesitter.lua)

| Key | Mode | Action |
|-----|------|--------|
| `<CR>` | n→v | Init selection / expand to next AST node |
| `<Tab>` | v | Jump selection to next enclosing scope |
| `<BS>` | v | Shrink selection one node |

### Plugins

| Key | Mode | Action | Source |
|-----|------|--------|--------|
| `<leader>sm` | n | Toggle maximize window | vim-maximizer.lua |
| `<leader>cf` | n, v | Format file or range | formatting.lua |
| `<leader>ee` | n | Toggle file explorer | nvim-tree.lua |
| `<leader>ef` | n | Toggle explorer on current file | nvim-tree.lua |
| `<leader>ec` | n | Collapse file explorer | nvim-tree.lua |
| `<leader>er` | n | Refresh file explorer | nvim-tree.lua |
| `<leader>eo` | n | Focus file explorer | nvim-tree.lua |
| `<leader>ff` | n | Fuzzy find files in cwd | telescope.lua |
| `<leader>fr` | n | Fuzzy find recent files | telescope.lua |
| `<leader>fs` | n | Find string in cwd (live grep) | telescope.lua |
| `<leader>fc` | n | Find string under cursor in cwd | telescope.lua |
| `<leader>wr` | n | Restore session for cwd | auto-session.lua |
| `<leader>ws` | n | Save session | auto-session.lua |

### Telescope (insert mode)

| Key | Mode | Action |
|-----|------|--------|
| `<C-k>` | i | Move selection up |
| `<C-j>` | i | Move selection down |

### Completion (nvim-cmp.lua)

| Key | Mode | Action |
|-----|------|--------|
| `<Tab>` | i | Select next completion item |
| `<S-Tab>` | i | Select previous completion item |
| `<C-Space>` | i | Trigger completion |
| `<C-e>` | i | Abort completion |
| `<CR>` | i | Confirm completion selection |

### Commands (init.lua)

| Command | Action |
|---------|--------|
| `:Compile` | Compile current C++ file (g++-15, Homebrew GCC, C++23) |
| `:Run [file]` | Run compiled binary with input |
