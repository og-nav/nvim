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
cd /Users/navinchikkodi/Desktop/nvim_setup

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
