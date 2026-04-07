My nvim configs, mostly taken from [this](https://www.josean.com/posts/how-to-setup-neovim-2024)

## Neovim Keybinds

> **NOTE:** Every command starts with `<leader>` which is `space` in my case.
>
> **ALSO NOTE:** All of these are also shown after 500ms of pressing `<leader>`, in case you forget.

- `<CR>` = Enter key
- `<BS>` = Backspace

---

### Window / Tab

- `sv` / `sh` — split window vertically / horizontally
- `se` — make splits equal size
- `sx` — close window
- `sm` — toggle maximize window
- `to` / `tx` — open / close new tab
- `tn` / `tp` — go to next / previous tab
- `tf` — open current buffer in new tab

---

### Terminal

`:`

---

### Tmux

- `<C-h/j/k/l>` — focus tmux left / down / up / right

---

### Explorer

- `ee` — toggle file explorer
- `ef` — toggle file explorer for current file
- `ec` / `er` — collapse / refresh file explorer
- `eo` — focus file explorer

---

### Completion

- `<Tab>` / `<S-Tab>` — next / previous item
- `<C-Space>` / `<C-e>` — trigger / abort completion

Say you pressed `<Esc>` accidentally but want the autocompletion back, then use `<C-Space>` to reopen it.
If there are too many suggestions blocking your view, `<C-e>` closes that popup.

---

### Telescope Finder

> Close with `Ctrl+C`. `Ctrl+j/k` to move down / up.

- `ff` — find file
- `fs` — find string
- `fr` — find recently opened files
- `fc` — find instances of the word under cursor

---

### Session

- `ws` — save session
- `wr` — restore session

Will also save periodically.
Example use case: if you have multiple window splits and do `:qa` to close all, `wr` can restore all the windows back.

---

### Autocomplete

- `Ctrl+j/k` — move down / up in suggestions
- `Ctrl+e` / `Ctrl+Space` — close / reopen suggestions

---

### Formatting

- `cf` — format

Only have linting / formatting for C/C++ set up so far.

---

### LaTeX

- `ll` — compile + continuous preview
- `lv` — view / refresh PDF in Skim
- `lk` — stop compilation
- `lc` — clean auxiliary files

---

### Treesitter

> **NOTE:** These do **not** need `<leader>` before them.

- `:InspectTree` — show the AST
- `<CR>` + `<CR>` + `<CR>` + … — init selection / expand to next node
- `<CR>` + `<Tab>` + `<Tab>` + … — expand out in scope
- `<BS>` — shrink selection one node

---

### Errors

- `gl` — show current error on cursor line
- `[d` / `]d` — previous / next error

---

### Templates

In any `.cpp` file, type `cpp` then press `<Tab>`.
