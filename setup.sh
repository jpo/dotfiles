#!/bin/bash

# Check that git is installed. Abort if it's not.
command -v git >/dev/null 2>&1 || { echo >&2 "Git must be installed. Aborting."; exit 1; }

# Update submodules (for vim plugins)
git submodule update --init --recursive

# Create symlinks for dot files in HOME
for file in $(ls -A | grep -v '^\(.git\|.gitignore\|.gitmodules\|.*.sh\)$');
do
    src="$( cd "$( dirname "$0" )"; pwd )/$file"
    dst="$HOME/$file"
    ln -sfv "$src" "$dst"
done
