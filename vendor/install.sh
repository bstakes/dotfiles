#!/usr/bin/env zsh

if  [[ "$OSTYPE" = darwin* ]]; then
  # install homebrew
  hash brew 2>/dev/null || { /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" && echo "Please agree to the Xcode license." && sudo xcodebuild -license }
  brew update
  brew upgrade
  brew bundle
  brew cleanup
  # Use brew-installed zsh if we are not in CI and not using it already
  fgrep -q '/usr/local/bin/zsh' /etc/shells 2> /dev/null
  if [ $? -ne 0 ] && [ -z ${CI+x} ]; then
    echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells
    chsh -s /usr/local/bin/zsh
  fi
else
  echo "Not on macOS. Skipping mac packages."
fi

mkdir -p ~/projects/github

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/catppuccin/delta ~/projects/github/delta
./install-fonts.sh
