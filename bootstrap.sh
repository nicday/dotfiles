#!/bin/sh -e

set -o errexit # abort on nonzero exitstatus
set -o nounset # abort on unbound variable

# Esnure git avaliable
if [ ! -e /Library/Developer/CommandLineTools/usr/bin/git ]; then
    start "Installing Apple Developer CLI Tools. Press any key when the installation has completed."
    xcode-select --install > /dev/null 2>&1
    read -r "" -sn1
fi

SRC_DIR="$HOME/src/github.com"
mkdir -p "$SRC_DIR"

# Install clone dotfiles
DOTFILES_REPO="https://github.com/nicday/dotfiles.git"
DOTFILES_DIR="$SRC_DIR/nicday/dotfiles"

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
    echo "Dotfiles repository already exists, pulling latest changes..."
    cd "$DOTFILES_DIR" && git pull origin main
fi

# Setup dotfiles
if [ -f "$DOTFILES_DIR/setup.sh" ]; then
    echo "Running setup.sh..."
    sh "$DOTFILES_DIR/setup.sh"
else
    echo "setup.sh not found in dotfiles repository. Please check the repository contents."
    exit 1
fi

echo ""
echo "Dotfiles setup complete."


