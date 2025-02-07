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
  link_file $SETUP_SCRIPT_DIR/$file ~/$file
done


if [[ "$OSTYPE" == "darwin"* ]]; then

# Step: Homebrew
  if ! which brew > /dev/null; then
    current_status "Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi;

  current_status "Installing via brew"
  brew bundle --file=~/Brewfile
fi

current_status "Installation successful 🚀"