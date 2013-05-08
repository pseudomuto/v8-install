#!/bin/sh
set -e 

SRC_DIR=/usr/local/src
SOURCE_DIR="$SRC_DIR/v8"
INCLUDE_DIR="/usr/include"
BIN_DIR=/usr/local/bin
REPO_ADDR=git://github.com/v8/v8.git

# ensure src dir
mkdir -p $SRC_DIR &>/dev/null

if [ ! -d $SOURCE_DIR ]; then
	# clone
	git clone $REPO_ADDR $SOURCE_DIR	
fi

# compile for native architecture
cd $SOURCE_DIR

# update
echo "Updating V8 sources..."
git pull &>/dev/null

echo "Installing dependencies and compiling for native environment...(this can take a while)"
make dependencies &>/dev/null
make native &>/dev/null

# create symlinks to d8 v8
echo "Updating symlinks..."
rm -rf "$BIN_DIR/v8" "$BIN_DIR/d8" "$INCLUDE_DIR/v8"
ln -s "$SOURCE_DIR/out/native/d8" "$BIN_DIR/d8" 
ln -s "$SOURCE_DIR/out/native/shell" "$BIN_DIR/v8" 
ln -s "$SOURCE_DIR/include" "$INCLUDE_DIR/v8"

echo "Done! d8 and v8 are now available globally."
