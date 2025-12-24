# 🚀 Neovim Configuration

A modern, feature-rich Neovim configuration with LSP support, beautiful UI, and powerful editing capabilities.

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)

## ✨ Features

- 🔌 **Plugin Manager**: [Lazy.nvim](https://github.com/folke/lazy.nvim) - fast and modern
- 🎨 **Theme**: VSCode Modern Theme
- 🔍 **Fuzzy Finder**: Telescope with fzf-native
- 📝 **LSP Support**: Full language server support via Mason
- ✅ **Auto-completion**: nvim-cmp with multiple sources
- 🌳 **File Explorer**: nvim-tree
- 🎯 **Syntax Highlighting**: Treesitter
- 🔧 **Formatting & Linting**: Conform.nvim & nvim-lint
- 📊 **Git Integration**: Gitsigns & Lazygit
- 💾 **Session Management**: Auto-session
- 🗺️ **Keymap Helper**: Which-key

## 📋 Requirements

- **Neovim** >= 0.9.0
- **Git**
- **Node.js** (for LSP servers)
- **Python 3** (for Python LSP)
- **Ripgrep** (optional - for Telescope live_grep and grep_string features)
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- **make** (for telescope-fzf-native)

### Installation of Requirements

#### macOS

```bash
brew install neovim git node ripgrep
```

#### Linux (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install neovim git nodejs npm ripgrep build-essential
```

#### Arch Linux

```bash
sudo pacman -S neovim git nodejs npm ripgrep make
```

## 🚀 One-Command Installation

### Unix/Linux/macOS

**⚠️ Warning**: This will backup your existing Neovim configuration.

```bash
bash <(curl -s https://raw.githubusercontent.com/og-nav/nvim/main/install.sh)
```

Or manually:

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)

# Clone the repository
git clone https://github.com/og-nav/nvim.git ~/.config/nvim

# Start Neovim (plugins will auto-install)
nvim
```

### Windows

**⚠️ Warning**: This will backup your existing Neovim configuration.

```powershell
powershell -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/og-nav/nvim/main/install.ps1 | iex"
```

Or manually:

```powershell
# Backup existing config
Move-Item -Path $env:LOCALAPPDATA\nvim -Destination $env:LOCALAPPDATA\nvim.backup.$(Get-Date -Format 'yyyyMMdd_HHmmss')

# Clone the repository
git clone https://github.com/og-nav/nvim.git $env:LOCALAPPDATA\nvim

# Start Neovim
nvim
```

## 🎮 Key Mappings

Leader key: `Space`

### General

| Key          | Description             |
| ------------ | ----------------------- |
| `jk`         | Exit insert mode        |
| `<leader>nh` | Clear search highlights |
| `<leader>+`  | Increment number        |
| `<leader>-`  | Decrement number        |

### Window Management

| Key          | Description               |
| ------------ | ------------------------- |
| `<leader>sv` | Split window vertically   |
| `<leader>sh` | Split window horizontally |
| `<leader>se` | Make splits equal size    |
| `<leader>sx` | Close current split       |

### Tab Management

| Key          | Description                    |
| ------------ | ------------------------------ |
| `<leader>to` | Open new tab                   |
| `<leader>tx` | Close current tab              |
| `<leader>tn` | Go to next tab                 |
| `<leader>tp` | Go to previous tab             |
| `<leader>tf` | Open current buffer in new tab |

### File Explorer (nvim-tree)

| Key          | Description                          |
| ------------ | ------------------------------------ |
| `<leader>ee` | Toggle file explorer                 |
| `<leader>ef` | Toggle file explorer on current file |
| `<leader>ec` | Collapse file explorer               |
| `<leader>er` | Refresh file explorer                |

### Telescope (Fuzzy Finder)

| Key          | Description                                 |
| ------------ | ------------------------------------------- |
| `<leader>ff` | Find files                                  |
| `<leader>fr` | Find recent files                           |
| `<leader>fs` | Find string in cwd (requires ripgrep)       |
| `<leader>fc` | Find string under cursor (requires ripgrep) |
| `<leader>ft` | Find todos                                  |

### Git

| Key          | Description  |
| ------------ | ------------ |
| `<leader>lg` | Open Lazygit |

### LSP

LSP keymaps are automatically set when an LSP server attaches to a buffer.

## 🔧 Customization

### Changing the Theme

Edit `lua/navin/plugins/colorscheme.lua` to use a different colorscheme.

### Adding Plugins

Add a new file in `lua/navin/plugins/` with your plugin configuration:

```lua
return {
  "author/plugin-name",
  config = function()
    -- plugin configuration
  end,
}
```

### Modifying LSP Servers

Edit `lua/navin/plugins/lsp/mason.lua` to add/remove LSP servers:

```lua
ensure_installed = {
  "tsserver",
  "lua_ls",
  -- add more here
}
```

## 📁 Project Structure

```
~/.config/nvim/
├── init.lua                          # Entry point
├── lazy-lock.json                    # Plugin version lock file
└── lua/
    └── navin/
        ├── core/
        │   ├── init.lua              # Core initialization
        │   ├── keymaps.lua           # Key mappings
        │   └── options.lua           # Vim options
        ├── lazy.lua                  # Lazy.nvim setup
        └── plugins/
            ├── init.lua              # Basic plugins
            ├── colorscheme.lua       # Theme configuration
            ├── telescope.lua         # Fuzzy finder
            ├── nvim-tree.lua         # File explorer
            ├── lualine.lua           # Statusline
            ├── treesitter.lua        # Syntax highlighting
            ├── nvim-cmp.lua          # Auto-completion
            ├── lsp/
            │   ├── mason.lua         # LSP installer
            │   └── lspconfig.lua     # LSP configuration
            └── ...                   # Other plugins
```

## 🔍 Installed LSP Servers

- **tsserver** - TypeScript/JavaScript
- **html** - HTML
- **cssls** - CSS
- **tailwindcss** - Tailwind CSS
- **lua_ls** - Lua
- **pyright** - Python
- **emmet_ls** - Emmet
- **prismals** - Prisma
- **graphql** - GraphQL
- **svelte** - Svelte

## 🛠️ Installed Formatters & Linters

**Formatters:**

- prettier (JavaScript/TypeScript/CSS/HTML/etc.)
- stylua (Lua)
- isort (Python imports)
- black (Python)

**Linters:**

- eslint_d (JavaScript/TypeScript)
- pylint (Python)

## 🐛 Troubleshooting

### Plugins not installing

Try running `:Lazy sync` inside Neovim.

### LSP not working

1. Check if the LSP server is installed: `:Mason`
2. Check LSP status: `:LspInfo`
3. Restart LSP: `:LspRestart`

### Treesitter errors

Update treesitter parsers: `:TSUpdate`

### Icons not showing

Make sure you have a [Nerd Font](https://www.nerdfonts.com/) installed and set as your terminal font.

### Ripgrep features not working

If you don't have ripgrep installed, the following features will be automatically disabled:

- `<leader>fs` - Telescope live_grep (find string in current working directory)
- `<leader>fc` - Telescope grep_string (find string under cursor)

All other features work without ripgrep. To enable these features, install ripgrep:

- **macOS**: `brew install ripgrep`
- **Ubuntu/Debian**: `sudo apt install ripgrep`
- **Windows**: `scoop install ripgrep` or `choco install ripgrep`

## 📚 Learning Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [LSP Configuration](https://github.com/neovim/nvim-lspconfig)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)

## 🤝 Contributing

Feel free to open issues or submit pull requests!

## 📝 License

MIT License - feel free to use this configuration for your own setup!

## 🙏 Acknowledgments

This configuration is built on the shoulders of giants. Thanks to all the plugin authors and the Neovim community!

---

**Enjoy your new Neovim setup! 🎉**

# 🚀 Quick Start: Push to GitHub

Follow these steps to get your Neovim configuration on GitHub and make it installable with one command.

## Step 1: Create a GitHub Repository

1. Go to [GitHub](https://github.com) and sign in
2. Click the **+** icon in the top right → **New repository**
3. Choose a name (e.g., `nvim-config` or `dotfiles-nvim`)
4. Make it **Public** (so the install script can clone it)
5. **Do NOT** initialize with README, .gitignore, or license (we already have these)
6. Click **Create repository**

## Step 2: Initialize Git and Push

Open a terminal and run these commands:

```bash
cd /Users/navinchikkodi/Desktop/nvim

# Initialize git repository
git init

# Add all files
git add .

# Make first commit
git commit -m "Initial commit: Neovim configuration"

# Add your GitHub repository as remote (replace with your info)
git remote add origin https://github.com/og-nav/nvim.git

# Push to GitHub
git branch -M main
git push -u origin main
```

## Step 3: Update the Installation Scripts

After pushing to GitHub, update these two files with your actual repository URL:

### In `README.md`:

Replace all instances of:

```
https://github.com/og-nav/nvim
```

With your actual repo URL, for example:

```
https://github.com/navinchikkodi/nvim-config
```

### In `install.sh` (line 18):

```bash
REPO_URL="https://github.com/og-nav/nvim.git"
```

### In `install.ps1` (line 5):

```powershell
[string]$RepoUrl = "https://github.com/og-nav/nvim.git"
```

## Step 4: Commit and Push Updates

```bash
git add README.md install.sh install.ps1
git commit -m "Update repository URLs in installation scripts"
git push
```

## Step 5: Test Your Installation

Now you can install your config with one command!

### On Unix/Linux/macOS:

```bash
bash <(curl -s https://raw.githubusercontent.com/og-nav/nvim/main/install.sh)
```

### On Windows (PowerShell):

```powershell
powershell -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/og-nav/nvim/main/install.ps1 | iex"
```

## 📝 Optional: Customize Your README

Update the following sections in `README.md`:

- Add screenshots of your setup
- Customize the feature list
- Add your personal touch
- Update the acknowledgments

## 🎯 What Happens on Installation?

When someone runs your install script:

1. ✅ Checks if Neovim and Git are installed
2. 💾 Backs up existing Neovim config (if any)
3. 📥 Clones your repository to `~/.config/nvim`
4. 🔌 On first Neovim launch:
   - Lazy.nvim auto-installs
   - All plugins install automatically
   - Mason installs LSP servers
   - Everything is ready to go!

## 🔧 Keeping Your Config Updated

When you make changes to your config:

```bash
cd ~/.config/nvim
git add .
git commit -m "Description of changes"
git push
```

To update on another machine:

```bash
cd ~/.config/nvim
git pull
```

Then restart Neovim and run `:Lazy sync` if needed.

## 📚 Pro Tips

1. **Fork Instead of Clone**: Tell users to fork your repo if they want to customize
2. **Use GitHub Actions**: Set up CI to test your config
3. **Add Screenshots**: Show off your beautiful setup
4. **Document Custom Keymaps**: Keep your README updated with new keybindings
5. **Version Control**: Use git tags for major versions (e.g., `v1.0.0`)

## 🆘 Common Issues

### "Permission denied" when running install.sh

```bash
chmod +x install.sh
./install.sh
```

### Git push rejected

If you get a push error, you might need to set up SSH or use a personal access token:

- [Generate SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- [Create personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)

---

**That's it! Your Neovim config is now shareable with the world! 🎉**
