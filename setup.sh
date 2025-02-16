#!/usr/bin/env bash

set -e

SETUP_SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

current_status() {
  printf "\e[33m⭑\e[0m %s\n" "$1"
}

link_file() {
  local src=$1 dst=$2
  mkdir -p "$(dirname "$dst")"
  ln -sf "$src" "$dst"
}

current_status "Installing ohmyzsh"
if [ -d ~/.oh-my-zsh ]; then
  current_status "Found ~/.oh-my-zsh - skipping this step"
else
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi


# Step: dotfiles
dotfiles=(.gemrc .railsrc .zshrc Brewfile) 

for file in "${dotfiles[@]}"
do
  current_status "Linking ${file}"
  rm -f ~/$file
  link_file "$SETUP_SCRIPT_DIR/$file" "$HOME/$file"
done

# Setup: setup bash directory
mkdir -p ~/.bash
for file in $SETUP_SCRIPT_DIR/.bash/*.bash; do
  filename=$(basename "$file")

  current_status "Linking ${file}"
  rm -f "$HOME/.bash/$filename"
  link_file "$file" "$HOME/.bash/$filename"
done

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Step: Homebrew
  if ! which brew > /dev/null; then
    current_status "Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi;

  current_status "Installing via brew"
  brew bundle --file=$SETUP_SCRIPT_DIR/Brewfile.common

  if [ -n "${BREWFILE}" ]; then
      current_status "Applying Brewfile: $SETUP_SCRIPT_DIR/Brewfile.$BREWFILE"
      brew bundle --file=$SETUP_SCRIPT_DIR/Brewfile.$BREWFILE
  fi
fi

# Symlink this directory into the home directory for convenience
if [[ -L "$HOME/.dotfiles" ]]; then
  echo "$HOME/.dotfiles already exists, skipping..."
else
  link_file "$SETUP_SCRIPT_DIR" "$HOME/.dotfiles"
fi

current_status "Installation successful 🚀"