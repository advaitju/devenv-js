#! /bin/bash

echo "--- SETUP STARTED ---"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Delete .git files and don't include README in devnenv setup
rm $DIR/.git $DIR/README.md

# Move dev env setup files
mv $DIR/{.,}* $DIR/..

# Install packages
mkdir -p $DIR/../node_modules

if [[ $1 == --n || $1 == -npm ]]; then
	npm i -D --prefix $DIR/.. eslint eslint-config-airbnb eslint-config-prettier eslint-plugin-prettier
	npx install-peerdeps -d --prefix $DIR/.. eslint-config-airbnb
elif [[ $1 == --p || $1 == -pnpm ]]; then
	pnpm i -D --prefix $DIR/.. eslint eslint-config-airbnb eslint-config-prettier eslint-plugin-prettier
	pnpx install-peerdeps -d --prefix $DIR/.. eslint-config-airbnb
else
	echo "Error: Specify whether to install with NPM (-p --npm) or PNPM (-p --pnpm)."
fi

# Delete setup script
rm $DIR/../setup.sh
rm -rf $DIR

echo "--- SETUP COMPLETE ---"
