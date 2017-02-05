#!/bin/bash

if ! which stow &> /dev/null; then
  echo "Install stow" > /dev/stderr
  exit 1
fi

cd files
stow * --target ~

