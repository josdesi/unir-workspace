#!/bin/sh



if [ ! -f "directories.txt" ]; then
    echo "Error: directories.txt file not found"
    exit 1
fi

cd ..
while read -r repo; do
    if [ -n "$repo" ]; then  # Skip empty lines
        echo "Cloning $repo..."
        git clone "https://github.com/josdesi/${repo}.git"
    fi
done < "ecards-workspace/directories.txt"
