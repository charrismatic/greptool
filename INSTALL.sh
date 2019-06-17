#!/bin/bash

# TARGET_DIR=$HOME/bin

cd $PWD/bin

if [ -d $TARGET_DIR ]; then
  echo "Installing 'g' to $HOME/bin"
  ln -s $PWD/g $TARGET_DIR/
  ln -s $PWD/greptool $TARGET_DIR/
fi
