#!/bin/sh

dirs_file="directories.txt"
if [ ! -f "$dirs_file" ]; then
    echo "Error: File $dirs_file not found"
    exit 1
fi
dirs=$(cat "$dirs_file")

git pull
cd ..
for dir in $dirs; do
  if [ -d "$dir" ]; then
    echo "Pulling in $dir..."
    cd "$dir"
    git pull
    cd ..
  else
    echo "Directory $dir does not exist, skipping."
  fi
done