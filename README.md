# 🚀 Modern Neovim Configuration

A fast, powerful Neovim setup with LSP, completion, and intuitive keymaps.

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)

## ⚡ Quick Install

### Unix/Linux/macOS

```bash
bash <(curl -s https://raw.githubusercontent.com/og-nav/nvim/main/install.sh)
```

### Windows (PowerShell)

```powershell
powershell -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/og-nav/nvim/main/install.ps1 | iex"
```

The script will backup your existing config and install everything automatically.

## 📋 Requirements

- **Neovim** >= 0.9.0
- **Git**
- **Node.js** (for LSP)
- **A [Nerd Font](https://www.nerdfonts.com/)** (for icons)
- **Ripgrep** (optional - for live grep)

### Install Requirements

**macOS:** `brew install neovim git node ripgrep`  
**Ubuntu:** `sudo apt install neovim git nodejs npm ripgrep build-essential`  
**Arch:** `sudo pacman -S neovim git nodejs npm ripgrep make`

## ✨ Key Features

- 🔌 **Plugin Manager**: Lazy.nvim
- 🎨 **Theme**: VSCode Modern
- 🔍 **Fuzzy Finder**: Telescope
- 📝 **LSP**: Full language server support (TypeScript, Python, Lua, etc.)
- ✅ **Completion**: nvim-cmp with snippets
- 🌳 **File Explorer**: nvim-tree
- 🎯 **Syntax**: Treesitter
- 🔧 **Formatting/Linting**: Conform.nvim & nvim-lint
- 📊 **Git**: Gitsigns, Lazygit, Git Conflict
- ⚡ **Navigation**: Flash, Harpoon, Illuminate
- 🔎 **Find & Replace**: Spectre
- 💾 **Sessions**: Auto-session & Persistence

## 🎮 Essential Keymaps

Leader key: **Space**

### File Navigation

| Key          | Action                           |
| ------------ | -------------------------------- |
| `<leader>ff` | Find files                       |
| `<leader>fh` | Find files (including hidden)    |
| `<leader>fr` | Recent files                     |
| `<leader>fs` | Find string in project (ripgrep) |
| `<leader>fc` | Find word under cursor (ripgrep) |

### File Explorer

| Key          | Action                    |
| ------------ | ------------------------- |
| `<leader>ee` | Toggle file explorer      |
| `<leader>eo` | Focus file explorer       |
| `<leader>ef` | Find current file in tree |

### Harpoon (Quick File Switching)

| Key               | Action                         |
| ----------------- | ------------------------------ |
| `<leader>a`       | Add file to harpoon            |
| `<leader>1/2/3/4` | Jump to harpooned file 1/2/3/4 |
| `Ctrl+e`          | Toggle harpoon menu            |

**Workflow:** Mark your 4 most-used files with `<leader>a`, then jump instantly with `<leader>1/2/3/4`

### Navigation

| Key                 | Action                                 |
| ------------------- | -------------------------------------- |
| `s` + 2 chars       | Flash jump (teleport anywhere visible) |
| `gg` / `G`          | Jump to top/bottom (auto-centered)     |
| `H` / `L`           | Jump to line start/end                 |
| `Ctrl+d` / `Ctrl+u` | Scroll half page (centered)            |
| `]]` / `[[`         | Next/previous reference                |

### Editing

| Key                  | Action                         |
| -------------------- | ------------------------------ |
| `jk`                 | Exit insert mode               |
| `Ctrl+s`             | Save file                      |
| `J` / `K` (visual)   | Move selected lines up/down    |
| `<` / `>` (visual)   | Indent and stay in visual mode |
| `<leader>p` (visual) | Paste without losing clipboard |
| `<leader>d`          | Delete without yanking         |
| `<leader>y`          | Yank to system clipboard       |

### Windows & Buffers

| Key             | Action                          |
| --------------- | ------------------------------- |
| `Ctrl+h/j/k/l`  | Navigate between windows        |
| `<leader>sv/sh` | Split vertically/horizontally   |
| `Shift+h/l`     | Previous/next buffer            |
| `<leader>bd`    | Delete buffer (preserve layout) |

### Find & Replace

| Key          | Action                    |
| ------------ | ------------------------- |
| `<leader>sr` | Find & replace in project |
| `<leader>sw` | Replace word under cursor |
| `<leader>sf` | Replace in current file   |

### Git

| Key                   | Action                              |
| --------------------- | ----------------------------------- |
| `<leader>lg`          | Open Lazygit                        |
| `<leader>gco/gct/gcb` | Choose ours/theirs/both (conflicts) |

## 🎓 Learning Path

**Day 1:**

- Use `s` + 2 chars to jump around (Flash) - this will change your life
- Try `Ctrl+h/j/k/l` for window navigation

**Day 2:**

- Mark files with `<leader>a`, jump with `<leader>1/2/3/4` (Harpoon)
- Use `<leader>eo` to quickly focus file explorer

**Day 3:**

- Practice `J/K` in visual mode to move lines
- Use `<leader>p` to paste without losing clipboard

**Week 2:**

- Explore `<leader>sr` for project-wide find & replace
- Use `]]` and `[[` to navigate references

## 🔧 Customization

### Change Theme

Edit `lua/navin/plugins/colorscheme.lua`

### Add LSP Servers

Edit `lua/navin/plugins/lsp/mason.lua`:

```lua
ensure_installed = {
  "tsserver",
  "lua_ls",
  -- add more here
}
```

### Add Plugins

Create a file in `lua/navin/plugins/`:

```lua
return {
  "author/plugin-name",
  config = function()
    -- config here
  end,
}
```

## 🐛 Troubleshooting

**Plugins not installing?**  
Run `:Lazy sync` in Neovim

**LSP not working?**

1. Check `:Mason` to see if servers are installed
2. Check `:LspInfo` for status
3. Try `:LspRestart`

**Icons not showing?**  
Install a [Nerd Font](https://www.nerdfonts.com/) and set it in your terminal

**Ripgrep features disabled?**  
Install ripgrep to enable `<leader>fs` and `<leader>fc`:

- macOS: `brew install ripgrep`
- Ubuntu: `sudo apt install ripgrep`
- Windows: `scoop install ripgrep`

## 🤝 Sharing Your Config

Want to push this to your own GitHub?

1. Create a new public repo on GitHub
2. Initialize and push:

```bash
cd /Users/navinchikkodi/Desktop/nvim
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git branch -M main
git push -u origin main
```

3. Update the repo URLs in `README.md`, `install.sh`, and `install.ps1`
4. Push the changes and share!

## 📝 License

MIT License

---

**Enjoy your supercharged Neovim! 🎉**
