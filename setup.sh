#!/bin/bash

echo
echo "--- SETUP STARTED ---" /bin/bash
echo

# Get path to devenv-js in current directory: ../project/devenv-js/
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "Path: $DIR"

IFS='/' read -ra ADDR <<< "$DIR"
PWD_NAME=${ADDR[-2]}
echo "Folder: $PWD_NAME"

# Delete .git files and don't include README in devnenv setup
rm -rf $DIR/.git
rm $DIR/README.md

# Move dev env setup files
mv $DIR/* $DIR/.* .
# Rename VSCode workspace file to match current directory
mv $DIR/../RENAMEME.code-workspace $DIR/../$PWD_NAME.code-workspace

# Install packages
mkdir -p $DIR/../node_modules
npm i -D --prefix $DIR/.. eslint @babel/eslint-parser @babel/preset-react eslint-config-airbnb eslint-config-prettier eslint-plugin-prettier prettier
# npx install-peerdeps -D --prefix $DIR/.. eslint-config-airbnb

# Delete setup script
rm $DIR/../setup.sh
rm -rf $DIR

echo
echo "--- SETUP COMPLETE ---"
echo
