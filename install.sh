#!/usr/bin/env bash

# Neovim Configuration Installer
# This script will backup your existing Neovim config and install this configuration

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
REPO_URL="https://github.com/og-nav/nvim.git"
NVIM_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
BACKUP_DIR="${NVIM_CONFIG_DIR}.backup.$(date +%Y%m%d_%H%M%S)"

# Helper functions
print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Main installation function
main() {
    echo ""
    echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║   Neovim Configuration Installer      ║${NC}"
    echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
    echo ""

    # Check prerequisites
    print_info "Checking prerequisites..."
    
    if ! command_exists nvim; then
        print_error "Neovim is not installed. Please install Neovim first."
        echo "Visit: https://neovim.io/"
        exit 1
    fi
    
    if ! command_exists git; then
        print_error "Git is not installed. Please install Git first."
        exit 1
    fi
    
    print_success "Prerequisites check passed!"
    
    # Check optional dependencies
    echo ""
    print_info "Checking optional dependencies..."
    
    if ! command_exists node; then
        print_warning "Node.js is not installed. Some LSP servers require Node.js."
    fi
    
    if ! command_exists rg; then
        print_warning "Ripgrep (rg) is not installed. Telescope's live_grep won't work."
    fi
    
    if ! command_exists make; then
        print_warning "Make is not installed. telescope-fzf-native may not build."
    fi

    # Backup existing configuration
    if [ -d "$NVIM_CONFIG_DIR" ]; then
        echo ""
        print_warning "Existing Neovim configuration found at: $NVIM_CONFIG_DIR"
        read -p "Do you want to backup and replace it? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            print_info "Installation cancelled."
            exit 0
        fi
        
        print_info "Backing up existing configuration to: $BACKUP_DIR"
        mv "$NVIM_CONFIG_DIR" "$BACKUP_DIR"
        print_success "Backup created successfully!"
    fi

    # Clone the repository
    echo ""
    print_info "Cloning Neovim configuration..."
    
    if git clone "$REPO_URL" "$NVIM_CONFIG_DIR"; then
        print_success "Configuration cloned successfully!"
    else
        print_error "Failed to clone repository."
        
        # Restore backup if clone failed
        if [ -d "$BACKUP_DIR" ]; then
            print_info "Restoring backup..."
            mv "$BACKUP_DIR" "$NVIM_CONFIG_DIR"
        fi
        exit 1
    fi

    # Installation complete
    echo ""
    echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║   Installation Complete! 🎉           ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
    echo ""
    
    print_info "Next steps:"
    echo "  1. Run 'nvim' to start Neovim"
    echo "  2. Plugins will automatically install (wait for Lazy.nvim to finish)"
    echo "  3. LSP servers will be installed automatically via Mason"
    echo "  4. Restart Neovim after installation completes"
    echo ""
    
    if [ -d "$BACKUP_DIR" ]; then
        print_info "Your old configuration is backed up at:"
        echo "  $BACKUP_DIR"
        echo ""
    fi
    
    print_info "To install recommended dependencies on macOS:"
    echo "  brew install neovim git node ripgrep"
    echo ""
    print_info "To install recommended dependencies on Ubuntu/Debian:"
    echo "  sudo apt install neovim git nodejs npm ripgrep build-essential"
    echo ""
    
    read -p "Do you want to start Neovim now? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        nvim
    fi
}

# Run main function
main

