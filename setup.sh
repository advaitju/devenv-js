#! /bin/bash

echo "--- SETUP STARTED ---"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Delete .git files and don't include README in devnenv setup
rm $DIR/.git $DIR/README.md

# Move dev env setup files
mv $DIR/{.,}* $DIR/..

# Install packages
mkdir -p $DIR/../node_modules

if [[ $1 == --npm || $1 == -n ]]; then
	npm i -D --prefix $DIR/.. eslint eslint-config-airbnb eslint-config-prettier eslint-plugin-prettier
	npx install-peerdeps -d --prefix $DIR/.. eslint-config-airbnb
elif [[ $1 == --pnpm || $1 == -p ]]; then
	pnpm i -D --prefix $DIR/.. eslint eslint-config-airbnb eslint-config-prettier eslint-plugin-prettier
	pnpx install-peerdeps -d --prefix $DIR/.. eslint-config-airbnb
fi

# Delete setup script
rm $DIR/../setup.sh
rm -rf $DIR

echo "--- SETUP COMPLETE ---"
