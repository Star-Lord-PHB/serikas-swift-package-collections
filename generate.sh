#!/bin/bash

PWD=$(pwd)

PACKAGES_JSON="packages.json"
GENERATED_JSON="collection.json"

find "$PWD" -type d | while read -r dir; do
    if [ -f "$dir/$PACKAGES_JSON" ]; then
        echo "Processing $dir"
        cd "$dir" || exit 1
        env package-collection-generate $PACKAGES_JSON $GENERATED_JSON
        cd "$PWD" || exit 1
    fi
done
