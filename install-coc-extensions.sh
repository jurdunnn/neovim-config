#!/bin/bash

# CoC Extensions Installation Script for Laravel/PHP Development
# This script installs essential CoC extensions for Laravel, PHP, Blade, and Alpine.js development

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print colored output
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Default CoC extensions directory
DEFAULT_COC_DIR="$HOME/.config/coc/extensions"

# Extensions to install
EXTENSIONS=(
    "coc-phpls"
    "coc-php-cs-fixer"
    "coc-html"
    "coc-emmet"
    "coc-blade"
    "coc-prettier"
    "coc-tailwindcss"
    "coc-eslint"
    "coc-tsserver"
    "coc-json"
    "coc-yaml"
    "coc-vimlsp"
    "@yaegassy/coc-phpstan"
    "coc-html-css-support"
    "prettier"
)

echo "=================================================="
echo "  CoC Extensions Installer for Laravel/PHP Dev"
echo "=================================================="
echo

# Check if npm is available
if ! command -v npm &> /dev/null; then
    print_error "npm is not installed or not in PATH"
    print_info "Please install Node.js and npm first"
    exit 1
fi

print_info "npm version: $(npm --version)"
echo

# Prompt for CoC extensions directory
print_info "Enter the path to your CoC extensions directory"
print_info "Default: ${DEFAULT_COC_DIR}"
echo -n "Path [press Enter for default]: "
read -r user_input

# Use default if no input provided
if [[ -z "$user_input" ]]; then
    COC_DIR="$DEFAULT_COC_DIR"
else
    COC_DIR="$user_input"
fi

# Expand tilde to home directory
COC_DIR="${COC_DIR/#\~/$HOME}"

print_info "Using CoC extensions directory: $COC_DIR"
echo

# Validate and create directory
if [[ ! -d "$COC_DIR" ]]; then
    print_warning "Directory does not exist: $COC_DIR"
    echo -n "Create directory? [y/N]: "
    read -r create_dir

    if [[ "$create_dir" =~ ^[Yy]$ ]]; then
        if mkdir -p "$COC_DIR"; then
            print_success "Created directory: $COC_DIR"
        else
            print_error "Failed to create directory: $COC_DIR"
            exit 1
        fi
    else
        print_error "Directory does not exist. Exiting."
        exit 1
    fi
else
    print_success "Directory exists: $COC_DIR"
fi

# Check if directory is writable
if [[ ! -w "$COC_DIR" ]]; then
    print_error "Directory is not writable: $COC_DIR"
    print_info "Please check permissions and try again"
    exit 1
fi

echo

# Change to extensions directory
if ! cd "$COC_DIR"; then
    print_error "Failed to change to directory: $COC_DIR"
    exit 1
fi

print_info "Installing CoC extensions for Laravel/PHP development..."
echo

# Check if package.json exists
if [[ -f "package.json" ]]; then
    print_info "Found existing package.json"
    echo -n "This will modify your existing package.json. Continue? [y/N]: "
    read -r continue_install

    if [[ ! "$continue_install" =~ ^[Yy]$ ]]; then
        print_info "Installation cancelled by user"
        exit 0
    fi
    echo
fi

# Create backup of existing package.json if it exists
if [[ -f "package.json" ]]; then
    BACKUP_FILE="package.json.backup.$(date +%Y%m%d_%H%M%S)"
    if cp "package.json" "$BACKUP_FILE"; then
        print_info "Created backup: $BACKUP_FILE"
    else
        print_warning "Failed to create backup of package.json"
    fi
fi

# Install extensions
print_info "Installing extensions..."
print_info "This may take a few minutes..."
echo

# Join extensions array into a space-separated string
EXTENSIONS_STR="${EXTENSIONS[*]}"

# Install all extensions in one command for efficiency
if npm install $EXTENSIONS_STR; then
    echo
    print_success "Successfully installed all CoC extensions!"
    echo

    # List installed extensions
    print_info "Installed extensions:"
    for ext in "${EXTENSIONS[@]}"; do
        echo "  ✓ $ext"
    done

    echo
    print_success "Installation completed successfully!"
    print_info "Please restart Neovim to activate the extensions"

else
    echo
    print_error "Failed to install some extensions"
    print_info "Check the npm output above for details"

    # Restore backup if installation failed
    if [[ -f "$BACKUP_FILE" ]]; then
        print_info "Restoring backup..."
        if cp "$BACKUP_FILE" "package.json"; then
            print_info "Backup restored"
        else
            print_error "Failed to restore backup"
        fi
    fi

    exit 1
fi

echo
print_info "Extensions directory: $COC_DIR"
print_info "You can run this script again to update extensions"
echo "=================================================="