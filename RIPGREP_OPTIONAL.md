# Optional Ripgrep Support

This Neovim configuration now **automatically detects** whether ripgrep is installed and adjusts functionality accordingly.

## What Changed?

### ✅ Works WITHOUT Ripgrep

**All plugins work normally**, including:

- ✅ Telescope file finder (`<leader>ff`)
- ✅ Telescope recent files (`<leader>fr`)
- ✅ Telescope find todos (`<leader>ft`)
- ✅ nvim-tree file explorer
- ✅ LSP features
- ✅ Auto-completion
- ✅ Treesitter syntax highlighting
- ✅ Git integration (gitsigns, lazygit)
- ✅ Formatting and linting
- ✅ All other plugins

### ⚠️ Requires Ripgrep (Auto-Disabled if Missing)

Only **2 Telescope features** require ripgrep:

- `<leader>fs` - Live grep (search for text across all files)
- `<leader>fc` - Grep string (search for word under cursor)

**If ripgrep is not installed:**

- These keymaps are automatically disabled
- You'll see a one-time notification: "Ripgrep not found. <leader>fs and <leader>fc are disabled."
- The Alpha dashboard won't show the "Find Word" button
- Everything else works perfectly!

## How It Works

The configuration uses a new utility module (`lua/navin/core/utils.lua`) that checks for ripgrep availability:

```lua
-- Automatically detects if ripgrep is installed
if utils.has_ripgrep() then
  -- Enable ripgrep-dependent features
else
  -- Disable gracefully with notification
end
```

## Installing Ripgrep (Optional)

If you want the live grep features, install ripgrep:

### macOS

```bash
brew install ripgrep
```

### Ubuntu/Debian

```bash
sudo apt install ripgrep
```

### Windows

```powershell
# Using Scoop
scoop install ripgrep

# Or using Chocolatey
choco install ripgrep
```

### Arch Linux

```bash
sudo pacman -S ripgrep
```

After installing ripgrep, restart Neovim and the features will automatically become available!

## Files Modified

1. **`lua/navin/core/utils.lua`** (NEW) - Utility functions for detecting commands
2. **`lua/navin/plugins/telescope.lua`** - Conditional keymap registration
3. **`lua/navin/plugins/alpha.lua`** - Conditional dashboard button
4. **`README.md`** - Updated requirements and troubleshooting sections

## No Configuration Needed!

The detection is **completely automatic**. You don't need to set any flags or environment variables. Just install (or don't install) ripgrep, and the configuration adapts automatically.
