#!/bin/bash

if [ -d "unzipped" ]; then
    exit 0
fi

mkdir unzipped

# Unzip all input instances *.xz in unzipped/ directory
echo "Unzipping files..."
for file in heuristic-tw-instances/*.xz; do
    unxz -c $file > unzipped/$(basename $file .xz)
    echo "Unzipped $(basename $file .xz)"
done
echo "------------------Unzipping done---------------------"