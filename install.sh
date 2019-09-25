#!/bin/sh

echo "Setting up your Mac ..."

# Install requirements
xcode-select --install

# Check for Homebrew and install if we don't have it.
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with Brewfile
brew tap homebrew/bundle
brew bundle

# Install Oh-My-Zsh & custom aliases

ZSH=~/.oh-my-zsh

if [ -d "$ZSH" ]; then
  echo "Oh My Zsh is already installed. Skipping.."
else
  echo "Installing Oh My Zsh..."
  curl -L http://install.ohmyz.sh | sh
fi

# Set macOS preferences
# This reloads the shell, that's why we run it last.
source .macos

