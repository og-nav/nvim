# Neovim Configuration Installer for Windows
# This script will backup your existing Neovim config and install this configuration

param(
    [string]$RepoUrl = "https://github.com/og-nav/nvim.git"
)

$ErrorActionPreference = "Stop"

# Configuration
$NvimConfigDir = "$env:LOCALAPPDATA\nvim"
$BackupDir = "$env:LOCALAPPDATA\nvim.backup.$(Get-Date -Format 'yyyyMMdd_HHmmss')"

# Helper functions
function Write-ColorOutput {
    param(
        [string]$Message,
        [string]$Color = "White"
    )
    Write-Host $Message -ForegroundColor $Color
}

function Test-CommandExists {
    param([string]$Command)
    $null -ne (Get-Command $Command -ErrorAction SilentlyContinue)
}

function Main {
    Write-Host ""
    Write-ColorOutput "╔════════════════════════════════════════╗" "Blue"
    Write-ColorOutput "║   Neovim Configuration Installer      ║" "Blue"
    Write-ColorOutput "╚════════════════════════════════════════╝" "Blue"
    Write-Host ""

    # Check prerequisites
    Write-ColorOutput "ℹ️  Checking prerequisites..." "Blue"
    
    if (-not (Test-CommandExists "nvim")) {
        Write-ColorOutput "❌ Neovim is not installed. Please install Neovim first." "Red"
        Write-Host "Visit: https://neovim.io/"
        exit 1
    }
    
    if (-not (Test-CommandExists "git")) {
        Write-ColorOutput "❌ Git is not installed. Please install Git first." "Red"
        exit 1
    }
    
    Write-ColorOutput "✅ Prerequisites check passed!" "Green"
    
    # Check optional dependencies
    Write-Host ""
    Write-ColorOutput "ℹ️  Checking optional dependencies..." "Blue"
    
    if (-not (Test-CommandExists "node")) {
        Write-ColorOutput "⚠️  Node.js is not installed. Some LSP servers require Node.js." "Yellow"
    }
    
    if (-not (Test-CommandExists "rg")) {
        Write-ColorOutput "⚠️  Ripgrep (rg) is not installed. Telescope's live_grep won't work." "Yellow"
    }

    # Backup existing configuration
    if (Test-Path $NvimConfigDir) {
        Write-Host ""
        Write-ColorOutput "⚠️  Existing Neovim configuration found at: $NvimConfigDir" "Yellow"
        $response = Read-Host "Do you want to backup and replace it? (y/N)"
        
        if ($response -ne 'y' -and $response -ne 'Y') {
            Write-ColorOutput "ℹ️  Installation cancelled." "Blue"
            exit 0
        }
        
        Write-ColorOutput "ℹ️  Backing up existing configuration to: $BackupDir" "Blue"
        Move-Item -Path $NvimConfigDir -Destination $BackupDir
        Write-ColorOutput "✅ Backup created successfully!" "Green"
    }

    # Clone the repository
    Write-Host ""
    Write-ColorOutput "ℹ️  Cloning Neovim configuration..." "Blue"
    
    try {
        git clone $RepoUrl $NvimConfigDir
        Write-ColorOutput "✅ Configuration cloned successfully!" "Green"
    }
    catch {
        Write-ColorOutput "❌ Failed to clone repository." "Red"
        
        # Restore backup if clone failed
        if (Test-Path $BackupDir) {
            Write-ColorOutput "ℹ️  Restoring backup..." "Blue"
            Move-Item -Path $BackupDir -Destination $NvimConfigDir
        }
        exit 1
    }

    # Installation complete
    Write-Host ""
    Write-ColorOutput "╔════════════════════════════════════════╗" "Green"
    Write-ColorOutput "║   Installation Complete! 🎉           ║" "Green"
    Write-ColorOutput "╚════════════════════════════════════════╝" "Green"
    Write-Host ""
    
    Write-ColorOutput "ℹ️  Next steps:" "Blue"
    Write-Host "  1. Run 'nvim' to start Neovim"
    Write-Host "  2. Plugins will automatically install (wait for Lazy.nvim to finish)"
    Write-Host "  3. LSP servers will be installed automatically via Mason"
    Write-Host "  4. Restart Neovim after installation completes"
    Write-Host ""
    
    if (Test-Path $BackupDir) {
        Write-ColorOutput "ℹ️  Your old configuration is backed up at:" "Blue"
        Write-Host "  $BackupDir"
        Write-Host ""
    }
    
    Write-ColorOutput "ℹ️  To install recommended dependencies on Windows:" "Blue"
    Write-Host "  Use Scoop or Chocolatey:"
    Write-Host "  scoop install neovim git nodejs ripgrep"
    Write-Host "  choco install neovim git nodejs ripgrep"
    Write-Host ""
    
    $response = Read-Host "Do you want to start Neovim now? (y/N)"
    if ($response -eq 'y' -or $response -eq 'Y') {
        nvim
    }
}

# Run main function
Main

