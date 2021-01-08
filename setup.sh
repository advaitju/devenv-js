#!/bin/bash

if [[ $1 == -n || $1 == --npm ]]; then
	echo "Selected package-manager: npm"
elif [[ $1 == -p || $1 == --pnpm ]]; then
	echo "Selected package-manager: pnpm"
else
	echo "Error: Specify whether to install with NPM (-p --npm) or PNPM (-p --pnpm)."
	exit 1
fi

echo
echo "--- SETUP STARTED ---" /bin/bash
echo

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Delete .git files and don't include README in devnenv setup
rm -rf $DIR/.git
rm $DIR/README.md

# Move dev env setup files
mv $DIR/{.,}* $DIR/..
# Rename VSCode workspace file
mv $DIR/RENAMEME.code-workspace $DIR/$DIR.code-workspace

# Install packages
mkdir -p $DIR/../node_modules

if [[ $1 == -n || $1 == --npm ]]; then
	npm i -D --prefix $DIR/.. babel-eslint eslint eslint-config-airbnb eslint-config-prettier eslint-plugin-prettier prettier
	npx install-peerdeps -d --prefix $DIR/.. eslint-config-airbnb
elif [[ $1 == -p || $1 == --pnpm ]]; then
	pnpm i -D --prefix $DIR/.. babel-eslint eslint eslint-config-airbnb eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react- eslint-plugin-react-hooks eslint-config-prettier eslint-plugin-prettier prettier
fi

# Delete setup script
rm $DIR/../setup.sh
rm -rf $DIR

echo
echo "--- SETUP COMPLETE ---"
echo
