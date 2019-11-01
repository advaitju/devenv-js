#! /bin/bash

echo "--- SETUP STARTED ---"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Delete .git directory
rm -rf $DIR/.git

# Move dev env setup files
mv $DIR/{.,}* $DIR/..

# Install packages
mkdir -p $DIR/../node_modules
npm i -D --prefix $DIR/.. eslint eslint-config-airbnb
npx install-peerdeps -D --prefix $DIR/.. eslint-config-airbnb

# Delete setup script
rm $DIR/../setup.sh
rm -rf $DIR

echo "--- SETUP COMPLETE ---"
