#!

if [[ $1 == -n || $1 == --npm ]]; then
	echo "Selected packagemanager: npm"
elif [[ $1 == -p || $1 == --pnpm ]]; then
	echo "Selected packagemanager: pnpm"
else
	echo "Error: Specify whether to install with NPM (-p --npm) or PNPM (-p --pnpm)."
	exit 1
fi

echo "--- SETUP STARTED ---" /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Delete .git files and don't include README in devnenv setup
rm $DIR/.git $DIR/README.md

# Move dev env setup files
mv $DIR/{.,}* $DIR/..

# Install packages
mkdir -p $DIR/../node_modules

if [[ $1 == -n || $1 == --npm ]]; then
	npm i -D --prefix $DIR/.. eslint eslint-config-airbnb eslint-config-prettier eslint-plugin-prettier prettier
	npx install-peerdeps -d --prefix $DIR/.. eslint-config-airbnb
elif [[ $1 == -p || $1 == --pnpm ]]; then
	pnpm i -D --prefix $DIR/.. eslint eslint-config-airbnb eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react- eslint-plugin-react-hooks eslint-config-prettier eslint-plugin-prettier prettier
fi

# Delete setup script
rm $DIR/../setup.sh
rm -rf $DIR

echo "--- SETUP COMPLETE ---"
