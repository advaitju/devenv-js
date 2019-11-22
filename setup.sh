#! /bin/bash

echo "--- SETUP STARTED ---"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Don't include README in devnenv setup
rm $DIR/README.md

# Move dev env setup files
mv $DIR/{.,}* $DIR/..

# Install packages
mkdir -p $DIR/../node_modules
npm i -D --prefix $DIR/.. eslint eslint-config-airbnb eslint-config-prettier eslint-plugin-prettier
npx install-peerdeps -d --prefix $DIR/.. eslint-config-airbnb

# Delete setup script
rm $DIR/../setup.sh
rm -rf $DIR

echo "--- SETUP COMPLETE ---"
