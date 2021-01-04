#!/usr/bin/env zsh

# Use extended globbing
setopt EXTENDED_GLOB

# Remove all dead links in home directory.
rm "${ZDOTDIR:-$HOME}"/*(-@D)

# Link all dotfiles to those in this repo.
for rcfile in "${ZDOTDIR:-$HOME}"/.dotfiles/home/^README.md(N); do
  if ! [ -e "${ZDOTDIR:-$HOME}/.${rcfile:t}" ]; then
    ln -fsnv "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  else
    echo skipping ${rcfile}
  fi
done
