#!/bin/bash

# Create symlinks for dot files in HOME
for file in $(ls -A | grep -v '^\(\.git\|\.gitignore\|.*\.sh\|.*\.ps1\)$');
do
    src="$( cd "$( dirname "$0" )"; pwd )/$file"
    dst="$HOME/$file"
    ln -sfv "$src" "$dst"
done
