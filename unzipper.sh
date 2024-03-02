#!/bin/bash

# Check if one argument is given
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 zipped-instances-dir"
    exit 1
fi

# Check if input directory exists
if [ ! -d "$1" ]; then
    echo "Directory $1 does not exist"
    exit 1
fi

unzippedDir="unzipped-$1"
# If already unzipped, exit
if [ -d $unzippedDir ]; then
    exit 0
fi

mkdir $unzippedDir

# Unzip all input instances *.xz in unzipped/ directory
echo "Unzipping files..."
for file in $1/*.xz; do
    unxz -c $file > $unzippedDir/$(basename $file .xz)
    echo "Unzipped $(basename $file .xz)"
done
echo "------------------Unzipping done---------------------"