# 🚀 Enhanced Features & Creative Keymaps

This document details all the awesome new features and creative keymaps added to your Neovim config!

## 🎯 New Creative Keymaps

### General Productivity

| Keymap   | Mode                 | Description                           |
| -------- | -------------------- | ------------------------------------- |
| `jk`     | Insert               | Exit insert mode (the one you loved!) |
| `Ctrl+s` | Normal/Insert/Visual | Save file quickly                     |
| `Ctrl+q` | Normal               | Quit                                  |
| `Ctrl+a` | Normal               | Select all text                       |

### Smart Navigation

| Keymap              | Mode          | Description                                 |
| ------------------- | ------------- | ------------------------------------------- |
| `j` / `k`           | Normal/Visual | Navigate wrapped lines correctly            |
| `H`                 | Normal/Visual | Jump to beginning of line (easier than `^`) |
| `L`                 | Normal/Visual | Jump to end of line (easier than `$`)       |
| `Ctrl+d` / `Ctrl+u` | Normal        | Scroll half page and center cursor          |
| `n` / `N`           | Normal        | Next/prev search result (centered)          |
| `]]` / `[[`         | Normal        | Next/prev reference (via illuminate)        |

### Better Editing

| Keymap      | Mode          | Description                               |
| ----------- | ------------- | ----------------------------------------- |
| `J` / `K`   | Visual        | Move selected lines up/down               |
| `<` / `>`   | Visual        | Indent left/right and stay in visual mode |
| `J`         | Normal        | Join lines without moving cursor          |
| `<leader>p` | Visual        | Paste without losing clipboard            |
| `<leader>d` | Normal/Visual | Delete without yanking to clipboard       |
| `<leader>y` | Normal/Visual | Yank to system clipboard                  |

### Window Navigation (Game Changer!)

| Keymap         | Mode   | Description                        |
| -------------- | ------ | ---------------------------------- |
| `Ctrl+h/j/k/l` | Normal | Navigate between windows instantly |
| `Arrow Keys`   | Normal | Resize current window              |
| `<leader>sv`   | Normal | Split vertically                   |
| `<leader>sh`   | Normal | Split horizontally                 |

### Buffer Navigation

| Keymap       | Mode   | Description                      |
| ------------ | ------ | -------------------------------- |
| `Shift+h`    | Normal | Previous buffer                  |
| `Shift+l`    | Normal | Next buffer                      |
| `<leader>x`  | Normal | Close current buffer             |
| `<leader>bd` | Normal | Delete buffer (preserves layout) |

### Tab Navigation

| Keymap                      | Mode   | Description               |
| --------------------------- | ------ | ------------------------- |
| `Alt+1` to `Alt+5`          | Normal | Jump directly to tabs 1-5 |
| `<leader>tn` / `<leader>tp` | Normal | Next/previous tab         |

### Undo Break Points

When typing in insert mode, these create undo break points so you can undo more granularly:

| Keymap          | Mode   | Description             |
| --------------- | ------ | ----------------------- |
| `,` `.` `!` `?` | Insert | Create undo break point |

---

## 🔌 New Powerful Plugins

### 1. **Flash.nvim** - Supercharged Navigation

Jump anywhere on screen with `s` + 2 characters. It's like teleportation!

**Keymaps:**

- `s` - Flash jump (type 2 chars to jump anywhere)
- `S` - Flash treesitter (jump to code structures)
- `/` then `Ctrl+s` - Toggle flash in search

**Use case:** Want to jump to a function 20 lines down? Press `s`, type the first 2 letters, and you're there!

### 2. **Harpoon 2** - Lightning Fast File Navigation

Mark your most important files and switch between them instantly!

**Keymaps:**

- `<leader>a` - Add current file to harpoon
- `Ctrl+e` - Open harpoon menu
- `<leader>1/2/3/4` - Jump to harpooned file 1/2/3/4
- `Ctrl+Shift+p/n` - Cycle through harpooned files

**Workflow:**

1. Open important files
2. Press `<leader>a` on each to "harpoon" them
3. Press `<leader>1`, `<leader>2`, etc. to jump instantly
4. Press `Ctrl+e` to see your list

**Use case:** Working on 4 related files? Harpoon them and switch instantly without Telescope!

### 3. **Vim-Illuminate** - Highlight References

Automatically highlights all occurrences of the word under your cursor.

**Keymaps:**

- `]]` - Jump to next occurrence
- `[[` - Jump to previous occurrence

**Use case:** Want to see all places a variable is used? Just hover over it!

### 4. **Spectre** - Find & Replace Across Project

Powerful find and replace with preview before committing changes.

**Keymaps:**

- `<leader>sr` - Open Spectre (search & replace)
- `<leader>sw` - Replace word under cursor
- `<leader>sf` - Replace in current file only

**Workflow:**

1. Press `<leader>sr`
2. Type search term in top box
3. Type replacement in second box
4. See all matches with preview
5. Press enter on specific items or `Ctrl+c` to replace all

**Use case:** Renamed a function? Use Spectre to update all references across your project!

### 5. **Git Conflict** - Better Merge Conflict Resolution

Visual indicators and easy keymaps for resolving git conflicts.

**Keymaps:**

- `<leader>gco` - Choose ours (current changes)
- `<leader>gct` - Choose theirs (incoming changes)
- `<leader>gcb` - Choose both
- `<leader>gc0` - Choose none
- `<leader>gcn` - Next conflict
- `<leader>gcp` - Previous conflict
- `<leader>gcl` - List all conflicts

**Use case:** Merge conflicts become visual and easy to resolve!

### 6. **Persistence.nvim** - Better Session Management

Auto-save and restore your workspace sessions.

**Keymaps:**

- `<leader>qs` - Restore session for current directory
- `<leader>ql` - Restore last session
- `<leader>qd` - Don't save current session

**Use case:** Working on multiple projects? Each gets its own session with open files and layout!

### 7. **Mini.bufremove** - Smart Buffer Deletion

Delete buffers without messing up your window layout.

**Keymaps:**

- `<leader>bd` - Delete buffer (asks to save if modified)
- `<leader>bD` - Force delete buffer

**Use case:** Close a file without closing the split!

### 8. **Mini.ai** - Enhanced Text Objects

Better text objects for more precise editing.

**Text objects:**

- `vif` - Select inside function
- `vaf` - Select around function
- `vic` - Select inside class
- `vac` - Select around class
- `vio` - Select inside block/loop/conditional

**Use case:**

- `dif` - Delete inside function
- `cic` - Change inside class
- `vio` - Select inside loop

---

## 💡 Workflow Tips

### Quick File Workflow

1. Use `<leader>ff` (Telescope) to find files initially
2. Harpoon your main files with `<leader>a`
3. Use `<leader>1/2/3/4` to jump between them instantly
4. Use `Ctrl+e` to manage your harpoon list

### Editing Workflow

1. Use `s` (Flash) to jump to any visible text
2. Use `]]` and `[[` to navigate between references
3. Use `<leader>p` in visual mode to paste without losing clipboard
4. Use visual mode with `J/K` to move lines around

### Search & Replace Workflow

1. Use `<leader>fs` for quick grep (if you have ripgrep)
2. Use `<leader>sr` (Spectre) for complex find/replace operations
3. Use `<leader>sw` to quickly replace word under cursor

### Git Workflow

1. Use `<leader>lg` for lazygit
2. When conflicts arise, use `<leader>gco/gct/gcb` to resolve
3. Use `<leader>gcl` to see all conflicts at once

### Buffer Management

1. Use `Shift+h/l` to navigate between buffers
2. Use `<leader>bd` to close buffers without closing windows
3. Use `<leader>x` for quick buffer close

### Window Management

1. Use `Ctrl+h/j/k/l` to navigate windows
2. Use arrow keys to resize windows
3. Use `<leader>sv/sh` to create splits

---

## 🎨 Why These Features Are Game-Changing

### 1. **Flash (s)** - Eliminates slow cursor movement

Instead of: `10j`, `5w`, `$` to reach a spot
Now: `s` + 2 characters → instant teleport!

### 2. **Harpoon** - Eliminates file tree browsing

Instead of: Opening file tree, navigating folders, clicking file
Now: `<leader>2` → instant file switch!

### 3. **Spectre** - Safe project-wide refactoring

Instead of: Manual find/replace with potential mistakes
Now: See all changes before applying them!

### 4. **Better Keymaps** - Ergonomic editing

- `H/L` for line start/end (easier than `^/$`)
- `J/K` in visual mode to move lines
- `Ctrl+s` to save (muscle memory from other editors)
- Centered cursor when searching/scrolling

### 5. **Window Navigation (Ctrl+hjkl)** - Split workflow

Makes using splits actually practical and fast!

---

## 📊 Comparison: Before vs After

| Task                          | Before               | After                     |
| ----------------------------- | -------------------- | ------------------------- |
| Jump to visible text          | `10j`, `5w`, `ft`    | `s` + 2 chars             |
| Switch between 4 key files    | `:e file`, Telescope | `<leader>1/2/3/4`         |
| Find & replace across project | Manual or scary :%s  | `<leader>sr` with preview |
| Move between windows          | `Ctrl+w h/j/k/l`     | `Ctrl+h/j/k/l`            |
| Delete buffer keep layout     | Hard!                | `<leader>bd`              |
| See all word occurrences      | Manual search        | Automatic highlight       |
| Resolve git conflicts         | Confusing markers    | Visual + easy keymaps     |
| Move lines up/down            | Cut & paste          | `J/K` in visual mode      |

---

## 🚀 Quick Start Guide

1. **Learn Flash first**: Try `s` to jump around - this will change your life!
2. **Set up Harpoon**: Mark your 4 most-used files with `<leader>a`
3. **Use window navigation**: Practice `Ctrl+h/j/k/l` instead of `Ctrl+w h/j/k/l`
4. **Try visual mode**: Select lines and use `J/K` to move them
5. **Better clipboard**: Use `<leader>p` to paste in visual mode
6. **Explore gradually**: Don't try to learn everything at once!

---

## 🎓 Pro Tips

1. **Flash + Visual Mode**: Press `v`, then `s`, then type to visually select to that point
2. **Harpoon Strategy**: Harpoon test file, implementation, component, and styles
3. **Spectre Safety**: Always review changes before applying (it shows you everything)
4. **Buffer vs Tab**: Use buffers for files in same project, tabs for different contexts
5. **Undo Break Points**: When typing a long sentence, the commas/periods create save points
6. **Centered Search**: The `n/N` centering means you never lose your search position
7. **System Clipboard**: Use `<leader>y` to copy to system clipboard, paste anywhere

---

Enjoy your supercharged Neovim! 🎉
